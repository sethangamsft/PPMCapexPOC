
using { microsoft.capex as capex } from '../db/schema';

@path: '/odata/v4/capexapprovalservice'
service CapexApproval  {

    entity CapexApproval as projection on capex.CapexApproval;

    entity CapexRequest  as projection on capex.CapexRequest;

    entity Approvers as projection on capex.Approvers;

    entity Users as projection on capex.CapexUsers;

    action approveRequest(ID: UUID, role_code:String, Comments:String)
        returns {
            message      : String;
            CapexRequest : Association to CapexRequest;
        };

    action rejectRequest(ID: UUID,  role_code:String, Comments:String)
        returns {
            message      : String;
            CapexRequest : Association to CapexRequest;
        };

    action getManager(ID: String) returns  Users;

    action getApprovers(LOBID: String) returns Approvers;
}
