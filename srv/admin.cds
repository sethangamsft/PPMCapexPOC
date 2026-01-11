using { microsoft.capex as capex } from '../db/schema';
 

/* ============================================================
   ADMIN SERVICE — Master Data (No Draft)
   ============================================================ */
@path: '/odata/v4/adminservice'
service AdminService {
@odata.draft.enabled
    entity RequestType as projection on capex.RequestType;
@odata.draft.enabled
    entity BusinessArea as projection on capex.BusinessArea;
@odata.draft.enabled
    entity InvestmentType as projection on capex.InvestmentType;
@odata.draft.enabled
    entity ReqStatus as projection on capex.ReqStatus;
@odata.draft.enabled
    entity CapexUsers as projection on capex.CapexUsers;

    /* Approvers may be editable, so draft is allowed */
    @odata.draft.enabled
    entity Approvers as projection on capex.Approvers;
    @readonly
    entity Portfolio as projection on capex.Portfolio;

    @readonly
    entity Role as projection on capex.Role;

}
 