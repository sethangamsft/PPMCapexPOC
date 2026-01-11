using {API_PROJECTPORTFOLIO as S4} from './external/API_PROJECTPORTFOLIO';
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
