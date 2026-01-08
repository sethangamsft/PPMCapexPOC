import cds from '@sap/cds';
// import { HierarchyLevelCalculator } from './utils/HierarchyLevelCalculator.js';
const { SELECT, INSERT, UPDATE, DELETE } = cds.ql;

/**
 * ---------------------------------------------------------------------
 * S4 SERVICE
 * ---------------------------------------------------------------------
 */
export class S4Service extends cds.ApplicationService {

  async init() {

    const remote = await cds.connect.to('API_PROJECTPORTFOLIO');

    this.on('READ', 'ProjectPortifolio', req => remote.run(req.query));
    this.on('READ', 'ProjectPortfolioItem', req => remote.run(req.query));
    this.on('READ', 'ProjectPortfolioBucket', req => remote.run(req.query));

    return super.init();
  }
}

/**
 * ---------------------------------------------------------------------
 * CAPEX SERVICE
 * ---------------------------------------------------------------------
 */
export class CapexService extends cds.ApplicationService {

  async init() {

    this.S4 = await cds.connect.to('API_PROJECTPORTFOLIO');

    const { CapexRequest } = this.entities;

    // Enable submit button
    this.after('READ', 'CapexRequest', each => {
      if (each.requestStatus_code)
        each.enableSubmit = each.requestStatus_code === '0001';
    });

    // Info message after save
    this.after([ 'CREATE', 'UPDATE'], 'CapexRequest', async(data, req) => {
      const { ID } = req.data;
      await this.submitforapproval({ params: { ID} });
      req.info(200, `CAPEX Request ${data.ID} saved successfully and submitted for approval`);
    });


    this.before(['UPDATE'], 'CapexRequest', (req) => {
      const { requestStatus_code } = req.data;

      if (!['0001'].includes(requestStatus_code)) {
        req.error(400, 'Cannot update CapexRequest with the current status.');
      }  
    });


    // Actions
    this.on('submitRequest', async req => {
      const { ID } = req.data;
      await this.submitforapproval({ params: { ID } });
      return { requestStatus: 'Submitted' };
    });

    // this.on('approveRequest', async req => {
    //   const { ID } = req.data;
    //   const result = await this.statusupdate(ID, '0003');
    //   if (result.isSucess) {
    //     return { message: `Capex ${ID} approved successfully` };
    //   }
    // });

    // S4 Reads
    this.on('READ', 'PortfolioBucket', req => this.GetS4PortfolioBucket(req));
    this.on('READ', 'Portfolio', req => this.GetS4Portfolio(req));

    return super.init();
  }

  /**
   * ---------------------------------------------------------------------
   * STATUS UPDATE
   * ---------------------------------------------------------------------
   */
  async statusupdate(ID, status) {
    try {
      const capex = await this.read('CapexRequest').where({ ID });

      if (!capex || capex.length === 0) {
        throw new Error(`Capex record ${ID} not found`);
      }

      await UPDATE('CapexRequest')
        .set({ requestStatus_code: status })
        .where({ ID });

      return { isSucess: true };

    } catch (error) {
      console.error('Status update failed:', error);
      throw new Error('Failed to update status');
    }
  }

  /**
   * ---------------------------------------------------------------------
   * SUBMIT FOR APPROVAL
   * ---------------------------------------------------------------------
   */
  async submitforapproval(req) {
    const { ID } = req.params;
    const result = await this.statusupdate(ID, '0002');
    if (result.isSucess) {
      return { message: `Capex ${ID} submitted for Approval` };
    }
  }

  /**
   * ---------------------------------------------------------------------
   * GET S4 PORTFOLIO
   * ---------------------------------------------------------------------
   */
  async GetS4Portfolio(req) {
    try {
      const { ProjectPortfolio } = this.S4.entities;

      const portfolioQuery = SELECT.from(ProjectPortfolio);
      let portfolio = await this.S4.run(portfolioQuery);

      portfolio = portfolio.map(item => {
        const desc = item.ProjPortfolioExplanationText?.trim()
          || item.ProjectPortfolioDescription?.trim();

        return {
          code: item.ProjectPortfolioUUID,
          name: item.ProjectPortfolioExternalID,
          description: desc
        };
      });

      return portfolio;

    } catch (error) {
      const { Portfolio } = this.entities;
      return SELECT.from(Portfolio);
    }
  }

  /**
   * ---------------------------------------------------------------------
   * GET S4 PORTFOLIO BUCKET
   * ---------------------------------------------------------------------
   */
  async GetS4PortfolioBucket(req) {
    const top = Number(req._queryOptions?.$top) || 100;
    const skip = Number(req._queryOptions?.$skip) || 0;

    const ZERO_GUID = "00000000-0000-0000-0000-000000000000";

    try {
      const { ProjectPortfolioBucket } = this.S4.entities;

      let id = req.query.SELECT.where?.[2]?.val;

      if (!id) {
        req.info('Please select the Line of Business First');
        return [];
      }

      const filter = {
        ParentObjectUUID: { '!=': ZERO_GUID },
        ProjectPortfolioUUID: id
      };

      const query = SELECT
        .from(ProjectPortfolioBucket)
        .where(filter)
        .limit(top, skip);

      const rows = await this.S4.run(query);

      // Normalize S4 rows into your internal structure
      const buckets = rows.map(item => ({
        code: item.ProjectPortfolioBucketUUID,
        name: item.ProjPortfolioBucketExternalID,
        description: item.ProjPortfolioBucketDescription,
        portfolio_code: item.ProjectPortfolioUUID,
        parent_code: item.ParentObjectUUID
      }));

      // 🔥 Compute hierarchy levels
      // const calc = new HierarchyLevelCalculator(buckets);
      // const result = calc.compute();

      return buckets;

    } catch (error) {
      try {
        const { PortfolioBucket } = this.entities;
        const local = await SELECT.from(PortfolioBucket);
        return local;
        //   const calc = new HierarchyLevelCalculator(local);
        //   return calc.compute();

      } catch {
        return req.warn('Invalid Value', { target: 'Capex/portfolioBucket' });
      }
    }
  }

}