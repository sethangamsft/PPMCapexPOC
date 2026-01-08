
using { microsoft.capex as capex } from '../db/schema';

@path: '/odata/v4/capexapprovalservice'
service CapexApproval  {

    entity CapexApproval as projection on capex.CapexApproval;

    entity CapexRequest  as projection on capex.CapexRequest;

    action approve(ID: UUID, Comments:String)
        returns {
            message      : String;
            CapexRequest : Association to CapexRequest;
        };

    action reject(ID: UUID, Comments:String)
        returns {
            message      : String;
            CapexRequest : Association to CapexRequest;
        };
}
