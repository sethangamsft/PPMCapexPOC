using {microsoft.capex as capex} from '../db/schema';

using { sap.common as common} from '@sap/cds/common';


/* ============================================================
   MAIN CAPEX SERVICE — FE ListReport/ObjectPage
   ============================================================ */

@path: '/odata/v4/capexservice'
service CapexService {

    /* Main editable CAPEX entity */
 entity CapexRequest as projection on capex.CapexRequest
        where createdBy = $user.id
           or requestor_ID = $user.id
           or collaborator_ID = $user.id;


    /* Read-only supporting entities */
    @readonly
    entity CapexApproval   as projection on capex.CapexApproval;

    @readonly
    entity PortfolioBucket as projection on capex.PortfolioBucket;

    @readonly
    entity Portfolio       as projection on capex.Portfolio;


    @readonly
    entity RequestType     as projection on capex.RequestType;

    @readonly
    entity BusinessArea    as projection on capex.BusinessArea;

    @readonly
    entity InvestmentType  as projection on capex.InvestmentType;

    @readonly
    entity ReqStatus       as projection on capex.ReqStatus;

    // <-- YOU MUST ADD THIS -->
    entity CapexUsers as projection on capex.CapexUsers;


    entity Region as Projection on capex.RegionCodes;


    entity Subregion as Projection on capex.SubregionCodes;

    entity Approvers as Projection on capex.Approvers;

    entity Country as Projection on common.Countries;

    @requires: 'authenticated-user'
    action submitRequest(ID: UUID) returns {
        requestStatus : String
    };
}

annotate CapexService.CapexRequest with @odata.draft.enabled;

