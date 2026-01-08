using { microsoft.capex as capex } from '../db/schema';
 

/* ============================================================
   ADMIN SERVICE — Master Data (No Draft)
   ============================================================ */
@path: '/odata/v4/adminservice'
service AdminService {

    entity RequestType as projection on capex.RequestType;

    entity BusinessArea as projection on capex.BusinessArea;

    entity InvestmentType as projection on capex.InvestmentType;

    entity ReqStatus as projection on capex.ReqStatus;

    /* Approvers may be editable, so draft is allowed */
    @odata.draft.enabled
    entity Approvers as projection on capex.Approvers;
}
annotate AdminService with @odata.draft.enabled;