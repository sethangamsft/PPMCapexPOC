import cds from '@sap/cds';
// import { HierarchyLevelCalculator } from './utils/HierarchyLevelCalculator.js';
const { SELECT, INSERT, UPDATE, DELETE } = cds.ql;


export class CapexApproval extends cds.ApplicationService {

  async init() {

    this.on('approveRequest', async req => this.processApproval(req,  '0005'));
    this.on('rejectRequest', async req => this.processApproval(req, '0006'));
    this.on('getManager',  async req => this.getManager(req));
    
    this.on('getApprovers', async req => this.getApprovers(req));
    return super.init();
  };

  async getManger(req){
    const {ID} = req.data;
    return await this.read('Users').where({code: ID})
  };

   async getApprovers(req){
    const {ID} = req.data;
    return await this.read('Approvers').where({lob_code : ID})
   };

  async processApproval(req, StatusCode) {
    const { ID, role_code, Comments } = req.data;
    // 1. Read existing record
    const capexRequest = await SELECT.one.from('CapexRequest').where({ ID });

    if (!capexRequest) {
      return req.error(404, `Capex Request ${ID} not found`);
    }

    const user =  await SELECT.one.from('Users').where({userID : req.user.id})
    if (!user){
      return req.error(400, `You are no longer Valid Approver ,Please contact Adminstrator to maintain your users`)
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
      approver_ID: req.user.id,
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

