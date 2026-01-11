import cds from '@sap/cds';
// import { HierarchyLevelCalculator } from './utils/HierarchyLevelCalculator.js';
const { SELECT, INSERT, UPDATE, DELETE } = cds.ql;


export class AdminService extends cds.ApplicationService {
    async init() {
        this.S4 = await cds.connect.to('API_PROJECTPORTFOLIO');
    this.on('READ', 'PortfolioBucket', req => this.GetS4PortfolioBucket(req));
    return super.init();
    }


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
  }}