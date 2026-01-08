namespace microsoft.capex;

// using { Attachments } from '@cap-js/attachments';
using {
  managed,
  cuid,
  Currency,
  Country
} from '@sap/cds/common';
using {domaintable, remotedomain, userdomain, capexExtensions} from './extensions';


entity CapexRequest : managed {
  key     ID                           : UUID @Core.Computed;
          requestor               : Association to  CapexUsers;
          requestorName : String(100);
          requestType                  : Association to RequestType default '0NEW';
          requestTitle                 : String(255) default 'New CAPEX Request';
          lineOfBusiness               : Association to Portfolio;
  virtual fieldControl_portfolioBucket : Integer default 0;

          @UI.FieldControl: fieldControl_portfolioBucket
          portfolioBucket              : Association to PortfolioBucket;
          requestStatus                : Association to ReqStatus default '0001';
          targetCAPCouncilDate         : Date;
          isLate                       : Boolean default false;
          requestDescription           : String(1024);
          businessArea                 : Association to BusinessArea;
          investmentType               : Association to InvestmentType;
          country                      : Country;
          region                       : Association to RegionCodes;
          subregion                    : Association to SubregionCodes;
          portfolioItem                : Association to PortfolioItem;
          inputDueDate                 : Date;
          collaborator                 : Association to CapexUsers;
          requestedAmount              : Decimal(15, 2);
          forecastedAmount             : Decimal(15, 2);
          currency                     : Currency;
          leadTimeInDays               : Integer default 0;
          Justification                : String(1024);
          extensions: Association to CapexExtensionsFields;
          // attachments: Composition of many Attachments;
          // financials                   :Association to  CapexFinancials
          //                                  on financials.capex = $self;
          approvals                    : Association to many CapexApproval
                                           on approvals.capex_RequestID = $self.ID;


}


entity CapexApproval : managed {
  key ID              : UUID @Core.Computed;
      capex_RequestID : UUID;
      approver        : String(100);
      approvalStatus  : Association to ReqStatus;
      approvalDate    : Date;
      comments        : String(1024);
}

entity BusinessArea : domaintable {

}

entity CapexExtensionsFields: capexExtensions{

}

entity RequestType : domaintable {}


entity InvestmentType : domaintable {}

entity Approvers : cuid, managed {
  lob   : Association to Portfolio;
  alias : Association to CapexUsers;
  role  : String(100);
  level : Integer;
}

entity Portfolio : remotedomain {
  portfolio : Association to Portfolio;
  parent    : Association to PortfolioItem;
}

entity PortfolioItem : remotedomain {

}

entity RegionCodes : domaintable {
  parent : Country;
}

entity SubregionCodes : domaintable {
  parent : Association to RegionCodes;
}

entity CapexUsers: userdomain{

}

entity PortfolioBucket : remotedomain {
  portfolio : Association to Portfolio;
  parent    : Association to PortfolioBucket;
};

entity ReqStatus : domaintable {
  
};

