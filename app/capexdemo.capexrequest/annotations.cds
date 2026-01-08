using CapexService as service from '../../srv/capex';
using from '@sap/cds/common';

annotate service.CapexRequest with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>RequestType}',
                Value : requestType_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>RequestTitle}',
                Value : requestTitle,
            }, {
                $Type : 'UI.DataField',
                Value : lineOfBusiness_code,
                Label : '{i18n>LineOfBusiness}',
            },
            {
                $Type : 'UI.DataField',
                Value : portfolioBucket_code,
                Label : '{i18n>PortifolioBucket}',
            },
            {
                $Type : 'UI.DataField',
                Value : businessArea_code,
                Label : '{i18n>BusinessArea}',
            },
            {
                $Type : 'UI.DataField',
                Value : investmentType_code,
                Label : '{i18n>InvestmentType}',
            },
            {
                $Type : 'UI.DataField',
                Value : targetCAPCouncilDate,
                Label : '{i18n>TargetCapCouncilDate1}',
            },
            {
                $Type : 'UI.DataField',
                Value : inputDueDate,
                Label : '{i18n>InputDueDate}',
            },
            
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Islate}',
                Value : isLate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>DetailedDescription}',
                Value : Justification,
            },
            {
                $Type : 'UI.DataField',
                Value : requestor_ID,
                Label : '{i18n>Requestor}',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
       
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Financials}',
            ID : 'Financials',
            Target : '@UI.FieldGroup#Financials',
        },
         
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>RequestHistory}',
            ID : 'i18nRequestHistory',
            Target : 'approvals/@UI.LineItem#i18nRequestHistory',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>RequestTitle}',
            Value : requestTitle,
        },
        {
            $Type : 'UI.DataField',
            Value : requestorName,
            Label : '{i18n>RequestorName}',
        },
        {
            $Type : 'UI.DataField',
            Value : businessArea_code,
            Label : '{i18n>BusinessArea}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>RequestType}',
            Value : requestType_code,
        },
        {
            $Type : 'UI.DataField',
            Value : requestedAmount,
            Label : '{i18n>RequestedAmount}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>RequestedStatus}',
            Value : requestStatus_code,
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
        },
    ],
    UI.SelectionFields : [
        requestStatus_code,
    ],
   
    UI.FieldGroup #Financials : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : leadTimeInDays,
                Label : '{i18n>LeadTimeInDays2}',
            },
            {
                $Type : 'UI.DataField',
                Value : requestedAmount,
                Label : '{i18n>RequestAmount}',
            },
            {
                $Type : 'UI.DataField',
                Value : forecastedAmount,
                Label : '{i18n>ForecastAmount}',
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
                Label : '{i18n>Currency}',
            },
            {
                $Type : 'UI.DataField',
                Value : requestDescription,
                Label : '{i18n>Justification}',
            },
        ],
    },
   
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : requestTitle,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : requestStatus.description,
        },
    } 
);

annotate service.CapexRequest with {
    requestType @(
        Common.Text : requestType.description,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.FieldControl : #Mandatory,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'RequestType',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : requestType_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.CapexRequest with {
    lineOfBusiness @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Portfolio',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : lineOfBusiness_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.Text : lineOfBusiness.description,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.ValueListWithFixedValues : true,
        Common.FieldControl : #Mandatory,
    )
};

annotate service.CapexRequest with {
    portfolioBucket @(
        Common.ValueList: {
            CollectionPath: 'PortfolioBucket',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterIn',
                    LocalDataProperty: 'lineOfBusiness_code',
                    ValueListProperty: 'portfolio_code'
                },
                {
                    $Type: 'Common.ValueListParameterOut',
                    LocalDataProperty: 'portfolioBucket_code',
                    ValueListProperty: 'code'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        },
        Common.Text: portfolioBucket.description,
        Common.Text.@UI.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.FieldControl : #Mandatory,
    )
};


annotate service.CapexRequest with {
    requestStatus @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ReqStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : requestStatus_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.Text : requestStatus.description,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.Label : '{i18n>RequestStatus}',
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.CapexRequest with{
    requestor@(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CapexUsers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : requestor_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'managerID',
                }
            ],
        },
        Common.Text : requestor.Name,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.FieldControl : #Mandatory,
    )
} ;


annotate service.CapexRequest with {
    businessArea @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BusinessArea',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : businessArea_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.Text : businessArea.description,
        Common.ValueListWithFixedValues : true,
        Common.FieldControl : #Mandatory,
    )
};

annotate service.CapexRequest with {
    investmentType @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'InvestmentType',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : investmentType_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.Text : investmentType.description,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.ValueListWithFixedValues : true,
        Common.FieldControl : #Mandatory,
    )
};

annotate service.CapexRequest with {
    requestedAmount @(
        Common.FieldControl : #Mandatory,
    )
};

annotate service.ReqStatus with {
    code @(
        Common.Text : description,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.RequestType with {
    code @(
        Common.Text : description,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

 

annotate service.BusinessArea with {
    code @(
        Common.Text : description,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.InvestmentType with {
    code @(
        Common.Text : description,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.Portfolio with {
    code @Common.Text : description
};

annotate service.PortfolioBucket with {
    code @Common.Text : description
};

annotate service.CapexRequest with {
    requestorName @Common.FieldControl : #Mandatory
};

annotate service.CapexRequest with {
    requestTitle @Common.FieldControl : #Mandatory
};

annotate service.CapexRequest with {
    isLate @Common.FieldControl : #Optional
};

annotate service.CapexRequest with {
    targetCAPCouncilDate @Common.FieldControl : #Mandatory
};

annotate service.CapexRequest with {
    currency @Common.FieldControl : #Mandatory
};

annotate service.CapexRequest with {
    forecastedAmount  @Common.FieldControl : #Mandatory
};

annotate service.CapexRequest with {
    requestDescription @(
        Common.FieldControl : #Mandatory,
        UI.MultiLineText : true,
    )
};

annotate service.CapexRequst with {
    Justification  @(
        Common.FieldControl : #Mandatory,
        UI.MultiLineText : true,
    )
};

 

annotate service.CapexApproval with @(
    UI.LineItem #i18nRequestHistory : [
        {
            $Type : 'UI.DataField',
            Value : approver,
            Label : '{i18n>Approver}',
        },
        {
            $Type : 'UI.DataField',
            Value : approvalDate,
            Label : '{i18n>ApprovalDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : comments,
            Label : '{i18n>Comments}',
        },
        {
            $Type : 'UI.DataField',
            Value : approvalStatus_code,
            Label : 'Approval Status',
        },
    ]
);




annotate service.CapexApproval with {
    approvalStatus @Common.Text : approvalStatus.description
};

