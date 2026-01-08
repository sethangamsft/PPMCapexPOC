import cds from '@sap/cds';
// import { HierarchyLevelCalculator } from './utils/HierarchyLevelCalculator.js';
const { SELECT, INSERT, UPDATE, DELETE } = cds.ql;


export class CapexApproval extends cds.ApplicationService {

  async init() {

    this.on('approve', async req => this.processApproval(req, '0005'));
    this.on('reject', async req => this.processApproval(req, '0006'));
    return super.init();
  }

  async processApproval(req, StatusCode) {
    const { ID, Comments } = req.data;
    // 1. Read existing record
    const capexRequest = await SELECT.one.from('CapexRequest').where({ ID });

    if (!capexRequest) {
      return req.error(404, `Capex Request ${ID} not found`);
    }

    // 2. Update fields
    await UPDATE('CapexRequest')
      .set({
        requestStatus_Code: StatusCode,
        modifiedAt: new Date(),
        modifiedBy: req.user.id
      })
      .where({ ID });


    await INSERT.into('CapexApproval').entries({
      capex_RequestID: ID,
      approver: req.user.id,
      approvalStatus_code: StatusCode,
      approvalDate: new Date().toISOString(), // store ISO string
      comments: Comments
    });

    // 3. Return updated record
    const updated = await SELECT.one.from('CapexRequest').where({ ID });

    return {
      message: `Capex Request ${ID} Proceseed successfully`,
      data: updated
    };

  } catch(error) {
    console.error('Update failed:', error);
    return req.error(500, 'Failed to update Capex Request');
  }

}

