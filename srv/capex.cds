using {microsoft.capex as capex} from '../db/schema';
using {API_PROJECTPORTFOLIO as S4} from './external/API_PROJECTPORTFOLIO';


/* ============================================================
   MAIN CAPEX SERVICE — FE ListReport/ObjectPage
   ============================================================ */

@path: '/odata/v4/capexservice'
service CapexService {

    /* Main editable CAPEX entity */
    entity CapexRequest           as
        projection on capex.CapexRequest {
            *,
            virtual enableSubmit : Boolean
        };

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


    @requires: 'authenticated-user'
    action submitRequest(ID: UUID) returns {
        requestStatus : String
    };
}

annotate CapexService.CapexRequest with @odata.draft.enabled;

// annotate CapexService.Capex with @changelog: [requestTitle] {
//   S/4HANA PROJECT PORTFOLIO SERVICE (Corrected Naming)
//============================================================ */
@path: '/S4Service'
service S4Service { 

    entity ProjectPortfolio       as
        projection on S4.ProjectPortfolio {
            key ProjectPortfolioUUID          as ID,
                ProjPortfolioExplanationText  as ExplanationText,
                ProjectPortfolioDescription   as Description,
                CreatedByUser                 as CreatedBy,
                ProjectPortfolioCreatedOnDate as CreationDate,
                LastChangedByUser             as LastChangedBy,
                LastChangeDateTime            as LastChangedDate,
                ProjectPortfolioType          as Type,
                ProjectPortfolioReleaseStatus as ReleaseStatus,

        };

    entity ProjectPortfolioBucket as
        projection on S4.ProjectPortfolioBucket {
            key ProjectPortfolioBucketUUID     as ID,
                ProjPortfolioBucketExternalID  as ExternalID,
                ProjectPortfolioUUID           as ProjectPortfolioID,
                ParentObjectUUID               as Parent,
                ProjPortfolioBucketDescription as Description,
                ProjPrtfloBucketReleaseStatus  as ReleaseStatus,
                ProjPrtfloBcktFinCurrency      as Currency,
                CreatedByUser                  as CreatedBy,
                ProjPrtfloBucketCreatedOnDate  as CreationDate,
                ProjPrtfloBcktCapPlngStartDate as CapacityPlanningStartDate,
                PrjPrtfloBcktCapPlngFinishDate as CapacityPlanningEndDate,
                ProjPrtfloBcktFinPlngStartDate as FinancialPlanStartDate,
                PrjPrtfloBcktFinPlngFinishDate as FinancialPlanEndDate,
                LastChangedByUser              as LastChangedBy,
                LastChangeDateTime             as LastChangedDate
        };

    entity ProjectPortfolioItem   as
        projection on S4.ProjectPortfolioItem {
            key ProjectPortfolioItemUUID       as ID,
                ProjectPortfolioItem           as ProjectPortfolioItem,
                ProjPortfolioItemDescription   as ItemDescription,
                ProjectPortfolioUUID           as ProjectPortfolioID,
                ProjPortfolioItemHeaderUUID    as Parent,
                ProjectPortfolioItemCurrency   as Currency,
                ProjectPortfolioItemType       as ItemType,
                ProjectPortfolioItemLocation   as ItemLocation,
                ProjectPortfolioItemGeography  as ItemGeography,
                ProjectPortfolioItemStatus     as Status,
                ProjPrtfloItmPlannedStartDate  as PlannedStartDate,
                ProjPrtfloItmPlannedFinishDate as PlannedEndDate,
                ProjPrtfloItmBudgetTotalAmount as BudgetTotalAmount

        };
}
