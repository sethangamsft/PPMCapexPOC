/* checksum : 7ad56a075efd2c7f5c3c2526c5469118 */
@cds.external : true
@CodeList.CurrencyCodes.Url : '../../../../default/iwbep/common/0001/$metadata'
@CodeList.CurrencyCodes.CollectionPath : 'Currencies'
@CodeList.UnitsOfMeasure.Url : '../../../../default/iwbep/common/0001/$metadata'
@CodeList.UnitsOfMeasure.CollectionPath : 'UnitsOfMeasure'
@Aggregation.ApplySupported.Transformations : [ 'aggregate', 'groupby', 'filter' ]
@Aggregation.ApplySupported.Rollup : #None
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features.DocumentDescriptionReference : '../../../../default/iwbep/common/0001/$metadata'
@PDF.Features.DocumentDescriptionCollection : 'MyDocumentDescriptions'
@PDF.Features.ArchiveFormat : true
@PDF.Features.Border : true
@PDF.Features.CoverPage : true
@PDF.Features.FitToPage : true
@PDF.Features.FontName : true
@PDF.Features.FontSize : true
@PDF.Features.Margin : true
@PDF.Features.Padding : true
@PDF.Features.Signature : true
@PDF.Features.HeaderFooter : true
@PDF.Features.ResultSizeDefault : 20000
@PDF.Features.ResultSizeMaximum : 20000
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service API_PROJECTPORTFOLIO {
  @cds.external : true
  type SAP__Message {
    code : String not null;
    message : String not null;
    target : String;
    additionalTargets : many String not null;
    transition : Boolean not null;
    @odata.Type : 'Edm.Byte'
    numericSeverity : Integer not null;
    longtextUrl : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Project Portfolio Item Capacity Planning'
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    { NavigationProperty: _Item, InsertRestrictions: { Insertable: false } },
    {
      NavigationProperty: _Portfolio,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    {
      Property: PrjPrtfloItmCapacityPlanAmount,
      AllowedExpressions: 'MultiValue'
    }
  ]
  entity PrjPortfolioItemCapacityPlan {
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key PrjPrtfloItmCapacityPlanUUID : UUID not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Capacity View Type'
    key PrjPrtfloItmCapacityPlanType : String(2) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Fiscal Year'
    key FiscalYear : String(4) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Fiscal Period'
    key FiscalPeriod : String(3) not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key PrjPrtfloItmCapPlnCategoryUUID : UUID not null;
    @Core.Computed : true
    @Common.Label : 'Start Date'
    PrjPrtfloItmCapPlanPeriodDate : Date;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    PrjPrtfloItmCapPlnChgdDateTime : DateTime;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Last Changed By'
    @Common.Heading : 'Changed By'
    PrjPrtfloItmCapPlnChangedBy : String(12) not null;
    @Common.FieldControl : #Mandatory
    @Measures.Unit : PrjPrtfloItmCapacityPlanUnit
    @Common.Label : 'Capacity Amount'
    PrjPrtfloItmCapacityPlanAmount : Decimal(26, 8) not null;
    @Common.IsUnit : true
    @Common.FieldControl : #Mandatory
    @Common.Label : 'Capacity Unit'
    PrjPrtfloItmCapacityPlanUnit : String(3) not null;
    @Common.FieldControl : #Mandatory
    @Common.IsUpperCase : true
    @Common.Label : 'Capacity Category'
    PrjPrtfloItmCapPlnCategoryId : String(15) not null;
    @Core.Computed : true
    @Common.Label : 'Status'
    PrjPrtfloItmCapPlnCatIsActive : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Original flag'
    PrjPrtfloItmCapPlnCatIsOrigl : Boolean not null;
    @Core.Immutable : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioItemUUID : UUID not null;
    @Common.FieldControl : #Mandatory
    @Common.Label : 'ID'
    PrjPrtfloItmCapPlnGroupId : String(24) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sponsor'
    PrjPrtfloItmCapPlnGrpSponsor : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Status'
    PrjPrtfloItmCapPlanGrpIsActive : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Original flag'
    PrjPrtfloItmCapPlnGrpIsOrigl : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioUUID : UUID not null;
    SAP__Messages : many SAP__Message not null;
    _Item : Association to one ProjectPortfolioItem;
    _Portfolio : Association to one ProjectPortfolio {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Proj Portfolio Bucket Capacity Planning'
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _Bucket,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _Portfolio,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: PrjPrtfloBcktCapPlnAmount, AllowedExpressions: 'MultiValue' }
  ]
  entity PrjPrtfloBucketCapacityPlan {
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key PrjPrtfloBcktCapPlanUUID : UUID not null;
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Plan Type'
    key PrjPrtfloBcktCapPlnType : String(2) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Fiscal Year'
    key FiscalYear : String(4) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Fiscal Period'
    key FiscalPeriod : String(3) not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key PrjPrtfloBcktCapPlnCatUUID : UUID not null;
    @Core.Computed : true
    @Common.Label : 'Start Date'
    PrjPrtfloBcktCapPlnPeriodDate : Date;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    PrjPrtfloBcktCapPlnChgdDteTme : DateTime;
    @Common.FieldControl : #Mandatory
    @Measures.Unit : PrjPrtfloBcktCapPlnUnit
    @Common.Label : 'Capacity Amount'
    PrjPrtfloBcktCapPlnAmount : Decimal(26, 8) not null;
    @Common.IsUnit : true
    @Common.FieldControl : #Mandatory
    @Common.Label : 'Capacity Unit'
    PrjPrtfloBcktCapPlnUnit : String(3) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Last Changed By'
    @Common.Heading : 'Changed By'
    PrjPrtfloBcktCapPlnChangedBy : String(12) not null;
    @Common.FieldControl : #Mandatory
    @Common.IsUpperCase : true
    @Common.Label : 'Capacity Category'
    PrjPrtfloBcktCapPlnCategoryId : String(15) not null;
    @Core.Computed : true
    @Common.Label : 'Status'
    PrjPrtfloBcktCapPlnCatIsActive : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Original flag'
    PrjPrtfloBcktCapPlnCatIsOrigl : Boolean not null;
    @Core.Immutable : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioBucketUUID : UUID not null;
    @Common.FieldControl : #Mandatory
    @Common.Label : 'ID'
    @Common.QuickInfo : 'Business Object ID'
    PrjPrtfloBcktCapPlnGroupId : String(24) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sponsor'
    PrjPrtfloBcktCapPlnGrpSponsor : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Status'
    PrjPrtfloBcktCapPlnGrpIsActive : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Original flag'
    PrjPrtfloBcktCapPlnGrpIsOrigl : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioUUID : UUID not null;
    SAP__Messages : many SAP__Message not null;
    _Bucket : Association to one ProjectPortfolioBucket;
    _Portfolio : Association to one ProjectPortfolio {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Proj Portfolio Bucket Financial Planning'
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _Bucket,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _Portfolio,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: PrjPrtfloBcktFinPlnAmount, AllowedExpressions: 'MultiValue' }
  ]
  entity PrjPrtfloBucketFinancialPlan {
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Financial View Type'
    key PrjPrtfloBcktFinPlnType : String(2) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Fiscal Year'
    key FiscalYear : String(4) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Fiscal Period'
    key FiscalPeriod : String(3) not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key PrjPrtfloBcktFinPlanUUID : UUID not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key PrjPrtfloBcktFinPlnCatUUID : UUID not null;
    @Core.Computed : true
    @Common.Label : 'Start Date'
    PrjPrtfloBcktFinPlnPeriodDate : Date;
    @Common.Label : 'TRUE'
    @Common.QuickInfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
    PrjPrtfloFinPlnPeriodIsInitial : Boolean not null;
    @Common.FieldControl : #Mandatory
    @Common.IsUpperCase : true
    @Common.Label : 'Capacity Category'
    PrjPrtfloBcktFinPlnCategoryId : String(15) not null;
    @Core.Computed : true
    @Common.Label : 'Status'
    PrjPrtfloBcktFinPlnCatIsActive : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Original flag'
    PrjPrtfloBcktFinPlnCatIsOrigl : Boolean not null;
    @Core.Immutable : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioBucketUUID : UUID not null;
    @Common.FieldControl : #Mandatory
    @Common.Label : 'ID'
    @Common.QuickInfo : 'Business Object ID'
    PrjPrtfloBcktFinPlnGroupId : String(24) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sponsor'
    PrjPrtfloBcktFinPlnGrpSponsor : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Status'
    PrjPrtfloBcktFinPlnGrpIsActive : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Original flag'
    PrjPrtfloBcktFinPlnGrpIsOrigl : Boolean not null;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    PrjPrtfloBcktFinPlnChgdDteTme : DateTime;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Last Changed By'
    @Common.Heading : 'Changed By'
    PrjPrtfloBcktFinPlnChangedBy : String(12) not null;
    @Common.FieldControl : #Mandatory
    @Measures.ISOCurrency : PrjPrtfloBcktFinPlnCurrency
    @Common.Label : 'Currency Amount'
    PrjPrtfloBcktFinPlnAmount : Decimal(precision: 16) not null;
    @Common.IsCurrency : true
    @Common.FieldControl : #Mandatory
    @Common.Label : 'Currency'
    PrjPrtfloBcktFinPlnCurrency : String(5) not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioUUID : UUID not null;
    SAP__Messages : many SAP__Message not null;
    _Bucket : Association to one ProjectPortfolioBucket;
    _Portfolio : Association to one ProjectPortfolio {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Proj Portfolio Item Financial Planning'
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    { NavigationProperty: _Item, InsertRestrictions: { Insertable: false } },
    {
      NavigationProperty: _Portfolio,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: PrjPrtfloItmFinPlanAmount, AllowedExpressions: 'MultiValue' }
  ]
  entity PrjPrtfloItemFinancialPlan {
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key PrjPrtfloItmFinPlnUUID : UUID not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Financial View Type'
    key PrjPrtfloItmFinancialPlanType : String(2) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Fiscal Year'
    key FiscalYear : String(4) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Fiscal Period'
    key FiscalPeriod : String(3) not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key PrjPrtfloItmFinPlnCategoryUUID : UUID not null;
    @Core.Computed : true
    @Common.Label : 'Start Date'
    PrjPrtfloItmFinPlanPeriodDate : Date;
    @Common.Label : 'TRUE'
    @Common.QuickInfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
    PrjPrtfloFinPlnPeriodIsInitial : Boolean not null;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    PrjPrtfloItmFinPlnChgdDateTime : DateTime;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Last Changed By'
    @Common.Heading : 'Changed By'
    PrjPrtfloItmFinPlanChangedBy : String(12) not null;
    @Common.FieldControl : #Mandatory
    @Measures.ISOCurrency : PrjPrtfloItmFinPlanCurrency
    @Common.Label : 'Currency Amount'
    PrjPrtfloItmFinPlanAmount : Decimal(precision: 16) not null;
    @Common.IsCurrency : true
    @Common.FieldControl : #Mandatory
    @Common.Label : 'Currency'
    PrjPrtfloItmFinPlanCurrency : String(5) not null;
    @Common.FieldControl : #Mandatory
    @Common.IsUpperCase : true
    @Common.Label : 'Capacity Category'
    PrjPrtfloItmFinPlnCategoryId : String(15) not null;
    @Core.Computed : true
    @Common.Label : 'Status'
    PrjPrtfloItmFinPlnCatIsActive : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Original flag'
    PrjPrtfloItmFinPlnCatIsOrigl : Boolean not null;
    @Core.Immutable : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioItemUUID : UUID not null;
    @Common.FieldControl : #Mandatory
    @Common.Label : 'ID'
    PrjPrtfloItmFinPlnGroupId : String(24) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sponsor'
    PrjPrtfloItmFinPlnGrpSponsor : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Status'
    PrjPrtfloItmFinPlnGrpIsActive : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Original flag'
    PrjPrtfloItmFinPlnGrpIsOrigl : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioUUID : UUID not null;
    SAP__Messages : many SAP__Message not null;
    _Item : Association to one ProjectPortfolioItem;
    _Portfolio : Association to one ProjectPortfolio {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Project Portfolio'
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _Bucket,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity ProjectPortfolio {
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key ProjectPortfolioUUID : UUID not null;
    @Common.Label : 'ID'
    @Common.QuickInfo : 'Business Object ID'
    ProjectPortfolioExternalID : String(24) not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ParentObjectUUID : UUID;
    ProjPortfolioExplanationText : String(60) not null;
    ProjectPortfolioDescription : String(40) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Changed By'
    @Common.QuickInfo : 'Changed by user'
    LastChangedByUser : String(12) not null;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    LastChangeDateTime : DateTime;
    @Common.IsUpperCase : true
    @Common.Label : 'Portfolio Type'
    @Common.QuickInfo : 'Portfolio'
    ProjectPortfolioType : String(15) not null;
    @Common.Label : 'Status'
    @Common.QuickInfo : 'Release Status'
    ProjectPortfolioReleaseStatus : String(5) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Classification'
    @Common.Heading : 'Classification Hierarchy'
    @Common.QuickInfo : 'Classification Hierarchy'
    PrjPrtfloIsClsfctnHierarchy : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Mandatory'
    ProjPrtfloHierarchyIsMandatory : String(1) not null;
    @Common.Label : 'Text Language'
    ProjectPortfolioMasterLanguage : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Created by'
    @Common.QuickInfo : 'Name of Person Who Created Object'
    CreatedByUser : String(12) not null;
    @Common.Label : 'Created On'
    @Common.QuickInfo : 'Date When the Object Was Created'
    ProjectPortfolioCreatedOnDate : Date;
    @Common.Composition : true
    _Bucket : Composition of many ProjectPortfolioBucket on _Bucket._Portfolio = $self;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Project Portfolio Bucket'
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _CapacityPlan,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _FinancialPlan,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _Portfolio,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _PortfolioItem,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity ProjectPortfolioBucket {
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key ProjectPortfolioBucketUUID : UUID not null;
    @Common.Label : 'ID'
    @Common.QuickInfo : 'Business Object ID'
    ProjPortfolioBucketExternalID : String(24) not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioUUID : UUID not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ParentObjectUUID : UUID;
    ProjPortfolioBucketDescription : String(40) not null;
    @Common.IsCurrency : true
    @Common.Label : 'Currency'
    ProjPrtfloBcktFinCurrency : String(5) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Fin Period Breakdown'
    @Common.Heading : 'Financial Period Breakdown'
    @Common.QuickInfo : 'Financial Period Breakdown'
    ProjPrtfloBcktFinPlngPerdType : String(2) not null;
    @Common.IsUnit : true
    @Common.Label : 'Capacity Unit'
    ProjPrtfloBucketCapacityUnit : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Changed By'
    @Common.QuickInfo : 'Changed by user'
    LastChangedByUser : String(12) not null;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    LastChangeDateTime : DateTime;
    @Common.Label : 'Status'
    @Common.QuickInfo : 'Release Status'
    ProjPrtfloBucketReleaseStatus : String(5) not null;
    @Common.Label : 'Capacity Start'
    @Common.Heading : 'Capacity Planning Start'
    @Common.QuickInfo : 'Capacity Planning Start Date'
    ProjPrtfloBcktCapPlngStartDate : Date;
    @Common.Label : 'Capacity Finish'
    @Common.Heading : 'Capacity Planning Finish'
    @Common.QuickInfo : 'Capacity Planning Finish Date'
    PrjPrtfloBcktCapPlngFinishDate : Date;
    @Common.Label : 'Financial Start'
    @Common.Heading : 'Financial Planning Start'
    @Common.QuickInfo : 'Financial Planning Start Date'
    ProjPrtfloBcktFinPlngStartDate : Date;
    @Common.Label : 'Financial Finish'
    @Common.Heading : 'Financial Planning Finish'
    @Common.QuickInfo : 'Financial Planning Finish Date'
    PrjPrtfloBcktFinPlngFinishDate : Date;
    @Common.IsDigitSequence : true
    @Common.Label : 'Cap Period Breakdown'
    @Common.Heading : 'Capacity Period Breakdown'
    @Common.QuickInfo : 'Capacity Period Breakdown'
    ProjPrtfloBcktCapPlngPerdType : String(2) not null;
    @Common.Label : 'Transfer Start Date'
    @Common.QuickInfo : 'Start Date for Transfer to SAP ERP'
    ProjPrtfloBcktTransfStartDate : Date;
    @Common.Label : 'Transfer Finish Date'
    @Common.QuickInfo : 'Finish Date for Transfer to SAP ERP'
    ProjPrtfloBcktTransfFinishDate : Date;
    @Common.IsUpperCase : true
    @Common.Label : 'Created by'
    @Common.QuickInfo : 'Name of Person Who Created Object'
    CreatedByUser : String(12) not null;
    @Common.Label : 'Created On'
    @Common.QuickInfo : 'Date When the Object Was Created'
    ProjPrtfloBucketCreatedOnDate : Date;
    @Common.Composition : true
    _CapacityPlan : Composition of many PrjPrtfloBucketCapacityPlan on _CapacityPlan._Bucket = $self;
    @Common.Composition : true
    _FinancialPlan : Composition of many PrjPrtfloBucketFinancialPlan on _FinancialPlan._Bucket = $self;
    _Portfolio : Association to one ProjectPortfolio;
    @Common.Composition : true
    _PortfolioItem : Composition of many ProjectPortfolioItem on _PortfolioItem._Bucket = $self;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Project Portfolio Decision Point'
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _Portfolio,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _PortfolioItem,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity ProjectPortfolioDecisionPoint {
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key ProjPrtfloItmDcsnPointUUID : UUID not null;
    @Common.Label : 'ID'
    ProjPrtfloItemDecisionPoint : String(24) not null;
    PrtfloItmDcsnPointDescription : String(40) not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioItemUUID : UUID not null;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    LastChangeDateTime : DateTime;
    @Common.IsUpperCase : true
    @Common.Label : 'Last Changed By'
    @Common.Heading : 'Changed By'
    ProjPrtfloItemDcsnPtChangedBy : String(12) not null;
    @Common.Label : 'Planned Start'
    @Common.QuickInfo : 'Planned Start Date'
    ProjPrtfloItmDcsnPtPlndStrtDte : Date;
    @Common.Label : 'Planned Finish'
    @Common.QuickInfo : 'Planned Finish Date'
    PrtfloItmDcsnPtPlndFinishDate : Date;
    @Common.Label : 'Actual Start'
    @Common.QuickInfo : 'Actual Start Date'
    ProjPrtfloItmDcsnPtActlStrtDte : Date;
    @Common.Label : 'Actual Finish'
    @Common.QuickInfo : 'Actual Finish Date'
    PrtfloItmDcsnPtActlFinishDate : Date;
    @Common.IsUpperCase : true
    @Common.Label : 'Status'
    ProjPrtfloItmDcsnPointStatus : String(5) not null;
    @Common.Label : 'Status'
    ProjPrtfloItmDcsnPointIsActive : Boolean not null;
    @Common.Label : 'Forecastd Start'
    @Common.Heading : 'Forecasted Start'
    @Common.QuickInfo : 'Forecasted Start'
    PrjPrtfloItmDcsnPtFcstdStrtDte : Date;
    @Common.Label : 'Forecast Finish'
    @Common.Heading : 'Forecasted Finish'
    @Common.QuickInfo : 'Forecasted Finish Date'
    PrtfloItmDcsnPtFcstdFinishDate : Date;
    @Common.Label : 'Forecaste DecisionDt'
    @Common.Heading : 'Forecasted Decision Date'
    @Common.QuickInfo : 'Forecasted Decision Date'
    PrtfloItmDcsnPointDecisionDate : Date;
    @Common.Label : 'Planned DecisionDate'
    @Common.Heading : 'Planned Decision Date'
    @Common.QuickInfo : 'Planned Decision date'
    ProjPrtfloItmDcsnPtPlndDcsnDte : Date;
    @Common.Label : 'Actual Decision Date'
    ProjPrtfloItmDcsnPtActlDcsnDte : Date;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioUUID : UUID not null;
    _Portfolio : Association to one ProjectPortfolio {  };
    _PortfolioItem : Association to one ProjectPortfolioItem;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Project Portfolio Item'
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _Bucket,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _CapacityPlan,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _DecisionPoint,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _FinancialPlan,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _ObjectLink,
      InsertRestrictions: { Insertable: false }
    },
    {
      NavigationProperty: _Portfolio,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    {
      Property: ProjPrtfloItemDevelopmentCost,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjectPortfolioItemLaunchCost,
      AllowedExpressions: 'MultiValue'
    },
    { Property: ProjPrtfloItmNPVAmount, AllowedExpressions: 'MultiValue' },
    {
      Property: ProjPrtfloItmExpdCommlValueAmt,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmFcstdBdgtTotAmt,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmFcstdBdgtAnnAmt,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmFcstdCostTotAmt,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItemYTDFcstdCost,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmBudgetTotalAmount,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmBdgtAnnualAmount,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPortfolioItemPlannedCost,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItemYTDPlannedCost,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjectPortfolioItemActualCost,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmYTDActualCost,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmRetOnInvmtAmount,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmIntRateOfRetAmt,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmFcstdDuration,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItemPlannedDuration,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItemActualDuration,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmPlndRevenueAmt,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmYTDPlannedRevenue,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPortfolioItemActualRevenue,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItemYTDActualRevenue,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmNPVPlanAmount,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmIntRateRetPlanAmt,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: ProjPrtfloItmRetOnInvmtPlanAmt,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: PrjPrtfloItmExpdCommlValPlnAmt,
      AllowedExpressions: 'MultiValue'
    }
  ]
  entity ProjectPortfolioItem {
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key ProjectPortfolioItemUUID : UUID not null;
    @Common.Label : 'ID'
    @Common.QuickInfo : 'Business Object ID'
    ProjectPortfolioItem : String(24) not null;
    ProjPortfolioItemDescription : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioUUID : UUID not null;
    @Core.Computed : true
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjPrtfloItemParentObjectUUID : UUID not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Category'
    ProjectPortfolioItemCategory : String(4) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Subcategory'
    ProjPortfolioItemSubcategory : String(4) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Stage'
    ProjectPortfolioItemStage : String(4) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Group'
    ProjectPortfolioItemGroup : String(4) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'TechnologyType'
    @Common.Heading : 'Technology Type'
    @Common.QuickInfo : 'Technology Type'
    ProjPrtfloItemTechnologyType : String(4) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Assessed Risk'
    @Common.Heading : 'Assessed Project Risk'
    @Common.QuickInfo : 'Assessed Project Risk'
    ProjPrtfloItmAssessedRiskValue : String(3) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Prob.Tech.Succ.'
    @Common.Heading : 'Probability Technical Success'
    @Common.QuickInfo : 'Probability of Technical Success'
    ProjPrtfloItmProbltyTechSuccss : String(3) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Prob.Comm.Succ.'
    @Common.Heading : 'Probability Commercial Success'
    @Common.QuickInfo : 'Probability of Commercial Success'
    ProjPrtfloItmProbltyCommSuccss : String(3) not null;
    @Common.Label : 'Actual Headcount'
    ProjPrtfloItemHeadcountValue : Decimal(10, 2) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Developmnt Cost'
    @Common.Heading : 'Development Cost'
    @Common.QuickInfo : 'Development Cost'
    ProjPrtfloItemDevelopmentCost : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Launch Cost'
    ProjectPortfolioItemLaunchCost : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'NPV (manual)'
    @Common.Heading : 'Net Present Value (manual)'
    @Common.QuickInfo : 'Net Present Value (manual)'
    ProjPrtfloItmNPVAmount : Decimal(precision: 16) not null;
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Currency'
    @Common.QuickInfo : 'Currency key'
    ProjectPortfolioItemCurrency : String(5) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Location'
    @Common.QuickInfo : 'Project Location'
    ProjectPortfolioItemLocation : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Area'
    @Common.QuickInfo : 'Project Geography'
    ProjectPortfolioItemGeography : String(4) not null;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    LastChangeDateTime : DateTime;
    @Common.IsDigitSequence : true
    @Common.Label : 'Fin Period Breakdown'
    @Common.Heading : 'Financial Period Breakdown'
    @Common.QuickInfo : 'Financial Period Breakdown'
    ProjPrtfloItmFinPeriodType : String(2) not null;
    @Common.IsUnit : true
    @Common.Label : 'Unit'
    ProjPortfolioItemCapacityUnit : String(3) not null;
    @Common.Label : 'Forecastd Start'
    @Common.Heading : 'Forecasted Start'
    @Common.QuickInfo : 'Forecasted Start'
    ProjPrtfloItmFcstdStartDate : Date;
    @Common.Label : 'Planned Start'
    @Common.QuickInfo : 'Planned Start Date'
    ProjPrtfloItmPlannedStartDate : Date;
    @Common.Label : 'Actual Start'
    @Common.QuickInfo : 'Actual Start Date'
    ProjPrtfloItemActualStartDate : Date;
    @Common.Label : 'Forecast Finish'
    @Common.Heading : 'Forecasted Finish'
    @Common.QuickInfo : 'Forecasted Finish Date'
    ProjPrtfloItmFcstdFinishDate : Date;
    @Common.Label : 'Planned Finish'
    @Common.QuickInfo : 'Planned Finish Date'
    ProjPrtfloItmPlannedFinishDate : Date;
    @Common.Label : 'Actual Finish'
    @Common.QuickInfo : 'Actual Finish Date'
    ProjPrtfloItemActualFinishDate : Date;
    @Common.Label : 'Escalation'
    @Common.QuickInfo : 'Escalation Flag'
    ProjPortfolioItemIsEscalated : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Type'
    ProjectPortfolioItemType : String(15) not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjPortfolioItemHeaderUUID : UUID;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'ECV (manual)'
    @Common.Heading : 'Expected Commercial Value (manual)'
    @Common.QuickInfo : 'Expected Commercial Value (manual)'
    ProjPrtfloItmExpdCommlValueAmt : Decimal(precision: 16) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Priority'
    @Common.QuickInfo : 'Priority Group'
    ProjPortfolioItemPriorityGroup : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Last Changed By'
    @Common.Heading : 'Changed By'
    ProjectPortfolioItemChangedBy : String(12) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Item Classification'
    ProjPrtfloItemClassification : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Status'
    ProjectPortfolioItemStatus : String(5) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Cap Period Breakdown'
    @Common.Heading : 'Capacity Period Breakdown'
    @Common.QuickInfo : 'Capacity Period Breakdown'
    ProjPrtfloItmCapPlngPerdType : String(2) not null;
    @Common.Label : 'Discount Rate'
    ProjPortfolioItemDiscountRate : Decimal(5, 2) not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjPrtfloDcsnPointActiveUUID : UUID;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Forecast. Bdgt Total'
    @Common.Heading : 'Forecasted Budget Total'
    @Common.QuickInfo : 'Portfolio Item Forecasted Budget Total'
    ProjPrtfloItmFcstdBdgtTotAmt : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Forecst. Bdgt Annual'
    @Common.Heading : 'Forecasted Budget Annual'
    @Common.QuickInfo : 'Portfolio Item Forecasted Budget Annual'
    ProjPrtfloItmFcstdBdgtAnnAmt : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Forecast. Cost Total'
    @Common.Heading : 'Forecasted Cost Total'
    @Common.QuickInfo : 'Portfolio Item Forecasted Cost Total'
    ProjPrtfloItmFcstdCostTotAmt : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Forecasted Cost YTD'
    @Common.QuickInfo : 'Portfolio Item Forecasted Cost YTD'
    ProjPrtfloItemYTDFcstdCost : Decimal(precision: 16) not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjPortfolioItemTemplateUUID : UUID;
    @Common.IsDigitSequence : true
    @Common.Label : 'RiskLimitUp'
    @Common.Heading : 'Risk Upper Limit'
    @Common.QuickInfo : 'Risk Group - Upper Limit'
    ProjPortfolioItemRiskPercent : String(3) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Risk Group Assessed'
    ProjectPortfolioItemRiskGroup : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Project Risk'
    ProjectPortfolioItemRiskIcon : String(4) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Derived Risk'
    ProjPortfolioItemDerivedRisk : String(3) not null;
    @Common.Label : 'Actual Headcount'
    ProjPrtfloItemActualHeadNmbrOf : Decimal(10, 2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Priority'
    @Common.Heading : 'Project Priority'
    ProjPortfolioItemPriorityIcon : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Stage'
    ProjPortfolioItemPhaseIcon : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Budget Status'
    @Common.QuickInfo : 'Budget'
    ProjectPortfolioItemBudgetIcon : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Schedule Status'
    @Common.QuickInfo : 'Schedule'
    ProjPortfolioItemScheduleIcon : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Staffing Status'
    @Common.QuickInfo : 'Staffing'
    ProjPortfolioItemStaffingIcon : String(4) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Total Budget'
    ProjPrtfloItmBudgetTotalAmount : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Annual Budget'
    ProjPrtfloItmBdgtAnnualAmount : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Planned Cost'
    @Common.QuickInfo : 'Planned Costs'
    ProjPortfolioItemPlannedCost : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Planned Costs YTD'
    @Common.QuickInfo : 'Planned Costs Year to Date'
    ProjPrtfloItemYTDPlannedCost : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Actual Cost'
    @Common.QuickInfo : 'Actual Costs'
    ProjectPortfolioItemActualCost : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Actual Cost YTD'
    @Common.QuickInfo : 'Actual Cost Year to Day'
    ProjPrtfloItmYTDActualCost : Decimal(precision: 16) not null;
    @Common.Label : 'Proposal'
    ProjectPortfolioItemIsProposal : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Status Group'
    ProjPortfolioItemStatusGroup : String(4) not null;
    @Common.Label : 'Actual Effort'
    ProjPrtfloItemWorkEffortTotal : Decimal(26, 8) not null;
    @Common.Label : 'Work Effort YTD'
    @Common.Heading : 'Work Effort Year-to-Date'
    @Common.QuickInfo : 'Work Effort Year-to-Date'
    ProjPrtfloItmYTDWorkEffort : Decimal(26, 8) not null;
    @Common.Label : 'Planned Effort'
    ProjectPortfolioItemWorkEffort : Decimal(26, 8) not null;
    @Common.Label : 'Planned Effort YTD'
    @Common.Heading : 'Planned Effort Year-to-Date'
    @Common.QuickInfo : 'Planned Effort Year-to-Date'
    ProjPrtfloItemYTDPlannedEffort : Decimal(26, 8) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'ROI in % (manual)'
    @Common.Heading : 'Return on Investment in % (manual)'
    @Common.QuickInfo : 'Return on Investment in % (manual)'
    ProjPrtfloItmRetOnInvmtAmount : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'IRR in % (manual)'
    @Common.Heading : 'Internal Rate of Return in % (manual)'
    @Common.QuickInfo : 'Internal Rate of Return in % (manual)'
    ProjPrtfloItmIntRateOfRetAmt : Decimal(precision: 16) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Risk Group Derived'
    ProjPrtfloItemDerivedRiskGroup : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Derived Risk'
    ProjPrtfloItemDerivedRiskIcon : String(4) not null;
    @Measures.Unit : ProjPortfolioItemCapacityUnit
    @Common.Label : 'For. Duration'
    @Common.Heading : 'Forecasted Duration'
    @Common.QuickInfo : 'Forecasted Duration'
    ProjPrtfloItmFcstdDuration : Decimal(precision: 4) not null;
    @Measures.Unit : ProjPortfolioItemCapacityUnit
    @Common.Label : 'Planned Duration'
    ProjPrtfloItemPlannedDuration : Decimal(precision: 4) not null;
    @Measures.Unit : ProjPortfolioItemCapacityUnit
    @Common.Label : 'Actual Duration'
    ProjPrtfloItemActualDuration : Decimal(precision: 4) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Staffing Group'
    @Common.Heading : 'Staffing Status Group'
    @Common.QuickInfo : 'Staffing Status Group'
    ProjPrtfloItmStfngStatusGroup : String(2) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Budget Status Group'
    ProjPrtfloItmBudgetStatusGroup : String(2) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Schedule Group'
    @Common.Heading : 'Schedule Status Group'
    @Common.QuickInfo : 'Schedule Status Group'
    ProjPrtfloItmSchedStatusGroup : String(2) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Planned Revenue'
    @Common.QuickInfo : 'Planned Revenues'
    ProjPrtfloItmPlndRevenueAmt : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Planned Revenue YTD'
    @Common.QuickInfo : 'Planned Revenues Year to Date'
    ProjPrtfloItmYTDPlannedRevenue : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Actual Revenue'
    @Common.QuickInfo : 'Actual Revenues'
    ProjPortfolioItemActualRevenue : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'Actual Revenue YTD'
    @Common.QuickInfo : 'Actual Revenues Year to Day'
    ProjPrtfloItemYTDActualRevenue : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'NPV'
    @Common.Heading : 'Net Present Value'
    @Common.QuickInfo : 'Net Present Value'
    ProjPrtfloItmNPVPlanAmount : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'IRR in %'
    @Common.Heading : 'Internal Rate of Return in %'
    @Common.QuickInfo : 'Internal Rate of Return in %'
    ProjPrtfloItmIntRateRetPlanAmt : Decimal(precision: 16) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'ROI in %'
    @Common.Heading : 'Return on Investment in %'
    @Common.QuickInfo : 'Return on Investment in %'
    ProjPrtfloItmRetOnInvmtPlanAmt : Decimal(precision: 16) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Payback Periods'
    @Common.Heading : 'Payback Periods in Months'
    @Common.QuickInfo : 'Payback Periods in Months'
    ProjPrtfloItemPaybackPlanValue : String(6) not null;
    @Measures.ISOCurrency : ProjectPortfolioItemCurrency
    @Common.Label : 'ECV'
    @Common.Heading : 'Expected Commercial Value'
    @Common.QuickInfo : 'Expected Commercial Value'
    PrjPrtfloItmExpdCommlValPlnAmt : Decimal(precision: 16) not null;
    _Bucket : Association to one ProjectPortfolioBucket;
    @Common.Composition : true
    _CapacityPlan : Composition of many PrjPortfolioItemCapacityPlan on _CapacityPlan._Item = $self;
    @Common.Composition : true
    _DecisionPoint : Composition of many ProjectPortfolioDecisionPoint on _DecisionPoint._PortfolioItem = $self;
    @Common.Composition : true
    _FinancialPlan : Composition of many PrjPrtfloItemFinancialPlan on _FinancialPlan._Item = $self;
    @Common.Composition : true
    _ObjectLink : Composition of many ProjPortfolioItemObjectLink on _ObjectLink._Item = $self;
    _Portfolio : Association to one ProjectPortfolio {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Project Portfolio Item Object Link'
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    { NavigationProperty: _Item, InsertRestrictions: { Insertable: false } },
    {
      NavigationProperty: _Portfolio,
      InsertRestrictions: { Insertable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.FilterRestrictions.Filterable : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    {
      Property: PrjPrtfloObjLnkObjectKeyValue,
      AllowedExpressions: 'SearchExpression'
    },
    {
      Property: PrjPrtfloObjectLinkDescription,
      AllowedExpressions: 'SearchExpression'
    }
  ]
  @Capabilities.SortRestrictions.NonSortableProperties : [ 'PrjPrtfloObjLnkObjectKeyValue', 'PrjPrtfloObjectLinkDescription' ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity ProjPortfolioItemObjectLink {
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    key ProjectPortfolioObjectLinkUUID : UUID not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioObjectUUID : UUID;
    @Common.IsUpperCase : true
    @Common.Label : 'Object Type'
    @Common.QuickInfo : 'Portfolio Mgmt: Type of Linked Object'
    ObjectLinkType : String(15) not null;
    @Common.Label : 'Key'
    @Common.QuickInfo : 'Key of the linked object'
    PrjPrtfloObjLnkObjectKeyValue : String not null;
    @Common.Label : 'Description'
    @Common.QuickInfo : 'Description of the linked object'
    PrjPrtfloObjectLinkDescription : String not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Creator'
    @Common.QuickInfo : 'Object creator'
    CreatedByUser : String(12) not null;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    CreatedOnDateTime : DateTime;
    @Common.IsUpperCase : true
    @Common.Label : 'Creator'
    @Common.QuickInfo : 'Object creator'
    LastChangedByUser : String(12) not null;
    @odata.Precision : 0
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Time Stamp'
    @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    LastChangeDateTime : DateTime;
    PrjPrtfloObjectLinkIsCtrlgLink : Boolean not null;
    PrjPrtfloObjectLinkIsDFMLink : Boolean not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioItemUUID : UUID not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Logical system'
    @Common.Heading : 'Log.System'
    PrjPrtfloObjLinkLogicalSystem : String(10) not null;
    @Common.Label : 'GUID'
    @Common.QuickInfo : 'Guid for application objects'
    ProjectPortfolioUUID : UUID not null;
    _Item : Association to one ProjectPortfolioItem;
    _Portfolio : Association to one ProjectPortfolio {  };
  };
};

