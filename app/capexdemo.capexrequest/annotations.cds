using CapexService as service from '../../srv/capex';
using from '@sap/cds/common';

annotate service.CapexRequest with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: requestor_ID,
                Label: '{i18n>Requestor1}',
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>RequestType}',
                Value: requestType_code,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>RequestTitle}',
                Value: requestTitle,
            },
            {
                $Type: 'UI.DataField',
                Value: lineOfBusiness_code,
                Label: '{i18n>LineOfBusiness}',
            },
            {
                $Type: 'UI.DataField',
                Value: portfolioBucket_code,
                Label: '{i18n>PortifolioBucket}',
            },
            {
                $Type: 'UI.DataField',
                Value: businessArea_code,
                Label: '{i18n>BusinessArea}',
            },
            {
                $Type: 'UI.DataField',
                Value: investmentType_code,
                Label: '{i18n>InvestmentType}',
            },
            {
                $Type: 'UI.DataField',
                Value: country_code,
                Label: 'Country',
            },
            {
                $Type: 'UI.DataField',
                Value: region_code,
                Label: '{i18n>Region}',
            },
            {
                $Type: 'UI.DataField',
                Value: subregion_code,
                Label: 'SubRegion',
            },
            {
                $Type: 'UI.DataField',
                Value: targetCAPCouncilDate,
                Label: '{i18n>TargetCapCouncilDate1}',
            },
            {
                $Type: 'UI.DataField',
                Value: inputDueDate,
                Label: '{i18n>InputDueDate}',
            },

            {
                $Type: 'UI.DataField',
                Label: '{i18n>Islate}',
                Value: isLate,
            },
            {
                $Type: 'UI.DataField',
                Value: collaborator_ID,
                Label: '{i18n>Collaborator}',
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>DetailedDescription}',
                Value: Justification,
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Financials}',
            ID    : 'Financials',
            Target: '@UI.FieldGroup#Financials',
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>RequestHistory}',
            ID    : 'i18nRequestHistory',
            Target: 'approvals/@UI.LineItem#i18nRequestHistory',
        },
    ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>RequestTitle}',
            Value: requestTitle,
        },
        {
            $Type: 'UI.DataField',
            Value: requestorName,
            Label: '{i18n>RequestorName}',
        },
        {
            $Type: 'UI.DataField',
            Value: businessArea_code,
            Label: '{i18n>BusinessArea}',
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>RequestType}',
            Value: requestType_code,
        },
        {
            $Type: 'UI.DataField',
            Value: requestedAmount,
            Label: '{i18n>RequestedAmount}',
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>RequestedStatus}',
            Value: requestStatus_code,
        },
        {
            $Type: 'UI.DataField',
            Value: currency_code,
            Label: '{i18n>Currency}',
        },
    ],
    UI.SelectionFields           : [requestStatus_code, ],
    UI.TableSettings             : {
        GrowingEnabled  : true,
        GrowingThreshold: 100,
        InlineDelete    : false
    },


    UI.FieldGroup #Financials    : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: leadTimeInDays,
                Label: '{i18n>LeadTimeInDays2}',
            },
            {
                $Type: 'UI.DataField',
                Value: requestedAmount,
                Label: '{i18n>RequestAmount}',
            },
            {
                $Type: 'UI.DataField',
                Value: forecastedAmount,
                Label: '{i18n>ForecastAmount}',
            },
            {
                $Type: 'UI.DataField',
                Value: currency_code,
                Label: '{i18n>Currency}',
            },
            {
                $Type: 'UI.DataField',
                Value: requestDescription,
                Label: '{i18n>Justification}',
            },
        ],
    },

    UI.HeaderInfo                : {
        Title         : {
            $Type: 'UI.DataField',
            Value: requestTitle,
        },
        TypeName      : '',
        TypeNamePlural: '',
        Description   : {
            $Type: 'UI.DataField',
            Value: requestStatus.description,
        },
    }
);

annotate service.CapexRequest with {
    requestType @(
        Common.Text                    : requestType.description,
        Common.Text.@UI.TextArrangement: #TextOnly,
        Common.FieldControl            : #Mandatory,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'RequestType',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: requestType_code,
                ValueListProperty: 'code',
            }, ],
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.CapexRequest with {
    lineOfBusiness @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Portfolio',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: lineOfBusiness_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description',
                },
            ],
        },
        Common.Text                    : lineOfBusiness.description,
        Common.Text.@UI.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.FieldControl            : #Mandatory,
    )
};

annotate service.CapexRequest with {
    portfolioBucket @(
        Common.ValueList               : {
            CollectionPath: 'PortfolioBucket',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: 'lineOfBusiness_code',
                    ValueListProperty: 'portfolio_code'
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: 'portfolioBucket_code',
                    ValueListProperty: 'code'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ],
        },
        Common.Text                    : portfolioBucket.description,
        Common.Text.@UI.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.FieldControl            : #Mandatory,

    )
};


annotate service.CapexRequest with {
    requestStatus @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ReqStatus',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: requestStatus_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description',
                },
            ],
        },
        Common.Text                    : requestStatus.description,
        Common.Text.@UI.TextArrangement: #TextOnly,
        Common.Label                   : '{i18n>RequestStatus}',
        Common.ValueListWithFixedValues: true,
    )
};


annotate service.CapexRequest with {
    businessArea @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'BusinessArea',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: businessArea_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description',
                },
            ],
        },
        Common.Text                    : businessArea.description,
        Common.ValueListWithFixedValues: true,
        Common.FieldControl            : #Mandatory,
    )
};

annotate service.CapexRequest with {
    investmentType @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'InvestmentType',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: investmentType_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description',
                },
            ],
        },
        Common.Text                    : investmentType.description,
        Common.Text.@UI.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.FieldControl            : #Mandatory,
    )
};

annotate service.CapexRequest with {
    requestedAmount @(Common.FieldControl: #Mandatory,
    )
};

annotate service.ReqStatus with {
    code @(
        Common.Text                    : description,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};

annotate service.RequestType with {
    code @(
        Common.Text                    : description,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};


annotate service.BusinessArea with {
    code @(
        Common.Text                    : description,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};

annotate service.InvestmentType with {
    code @(
        Common.Text                    : description,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};

annotate service.Portfolio with {
    code @Common.Text: description
};


annotate service.CapexRequest with {
    requestTitle @Common.FieldControl: #Mandatory
};

annotate service.CapexRequest with {
    isLate @Common.FieldControl: #Optional
};

annotate service.CapexRequest with {
    targetCAPCouncilDate @Common.FieldControl: #Mandatory
};

annotate service.CapexRequest with {
    currency @Common.FieldControl: #Mandatory
};

annotate service.CapexRequest with {
    forecastedAmount @Common.FieldControl: #Mandatory
};

annotate service.CapexRequest with {
    requestDescription @(
        Common.FieldControl: #Mandatory,
        UI.MultiLineText   : true,
    )
};

annotate service.CapexRequest with {
    Justification @(
        Common.FieldControl: #Mandatory,
        UI.MultiLineText   : true,
    )
};


annotate service.CapexApproval with @(
    UI.LineItem #i18nRequestHistory: [
        {
            $Type: 'UI.DataField',
            Value: approver_ID,
            Label: '{i18n>Approver}',
        },
        {
            $Type: 'UI.DataField',
            Value: role_code,
            Label: '{i18n>Role1}',
        },
        {
            $Type: 'UI.DataField',
            Value: approvalDate,
            Label: '{i18n>ApprovalDate}',
        },
        {
            $Type: 'UI.DataField',
            Value: approvalStatus_code,
            Label: '{i18n>ApprovalStatus}',
        },
        {
            $Type: 'UI.DataField',
            Value: comments,
            Label: '{i18n>Comments}',
        },
    ],
    UI.Facets                      : [{
        $Type : 'UI.CollectionFacet',
        Label : '{i18n>ApprovalHistory}',
        ID    : 'i18nApprovalHistory',
        Facets: [],
    }, ],
);


annotate service.CapexApproval with {
    approvalStatus @Common.Text: approvalStatus.description
};

annotate service.CapexRequest with {
    requestor @(
        Common.Text                    : requestor.Name,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'CapexUsers',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: requestor_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Name',
                }
            ],
        },
        Common.ValueListWithFixedValues: true,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};

annotate service.CapexUsers with {
    ID @(
        Common.Text                    : Name,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};



annotate service.CapexRequest with {
    subregion @(
        Common.Text                    : subregion.description,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Subregion',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: region_code,
                    ValueListProperty: 'parent_code'
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: subregion_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description',
                },


            ],
        },
        Common.ValueListWithFixedValues: true,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};

annotate service.Subregion with {
    code @(
        Common.Text                    : description,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};

annotate CapexService.CapexRequest with {
    region @(
        Common.Text                    : region.description,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Region',
            Parameters    : [ 
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: 'region_code',
                    ValueListProperty: 'code'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        },
        Common.ValueListWithFixedValues: true,
        Common.Text.@UI.TextArrangement: #TextOnly,
    );
};

// annotate CapexService.CapexRequest with {
//     region @(
//         Common.Text                    : region.description,
//         Common.ValueList               : {
//             $Type         : 'Common.ValueListType',
//             CollectionPath: 'Region',
//             Parameters    : [
//                 {
//                     $Type            : 'Common.ValueListParameterIn',
//                     LocalDataProperty: 'country_code',
//                     ValueListProperty: 'parent_code'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterOut',
//                     LocalDataProperty: 'region_code',
//                     ValueListProperty: 'code'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty: 'description'
//                 }
//             ]
//         },
//         Common.ValueListWithFixedValues: true,
//         Common.Text.@UI.TextArrangement: #TextOnly,
//     );
// };
// annotate service.Region with {
//     code @(
//         Common.Text : description,
//         Common.Text.@UI.TextArrangement : #TextOnly,
// )};


annotate service.PortfolioBucket with {
    code @(
        Common.Text                    : description,
        Common.Text.@UI.TextArrangement: #TextOnly,
    )
};

annotate service.CapexRequest with {
    requestor_ID @(
        Common.Text                    : requestor.Name,
        Common.Text.@UI.TextArrangement: #TextOnly,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'CapexUsers',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: requestor_ID,
                ValueListProperty: 'userID',
            }, ],
        },
        Common.ValueListWithFixedValues: true,
    )
};
annotate service.CapexUsers with {
    userID @(Common.Text: Name,
    Common.Text.@UI.TextArrangement : #TextOnly, )
};

annotate service.CapexRequest with @UI.Table: {FullScreen: true

};

annotate service.CapexRequest with {
    collaborator @(
        Common.Text : collaborator.Name,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CapexUsers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : collaborator_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.CapexRequest with {
    collaborator_ID @(
        Common.Text : collaborator.Name,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CapexUsers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : collaborator_ID,
                    ValueListProperty : 'userID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

