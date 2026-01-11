using AdminService as service from '../../srv/admin';

annotate service.Approvers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : lob_code,
                Label : '{i18n>LineOfBusiness}',
            },
            {
                $Type : 'UI.DataField',
                Value : alias_ID,
                Label : '{i18n>ApproverId}',
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ApprovalRole}',
                Value : role_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Approval Level',
                Value : level,
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : lob_code,
            Label : '{i18n>LineOfBusiness1}',
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ApprovalRole}',
            Value : role_code,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : alias_ID,
            Label : '{i18n>ApproverId}',
             @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ApprovalLevel}',
            Value : level,
        },
    ], UI.TableSettings             : {
        GrowingEnabled  : true,
        GrowingThreshold: 100,
        InlineDelete    : false
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : lob.description,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
        Initials : modifiedBy,
    },
);

annotate service.Approvers with {
    lob @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Portfolio',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : lob_code,
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
        Common.Text : lob.name,
        Common.ValueListWithFixedValues : true,
        Common.Text.@UI.TextArrangement : #TextFirst,
    )
};

annotate service.Approvers with {
    alias @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CapexUsers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : alias_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'userID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'manager_ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
       
    )
};

annotate service.Approvers with {
    role @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Role',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : role_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.Text : role.description,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Approvers with {
    alias @(
        Common.Text : alias.Name,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};


 
annotate service.Approvers with @UI.Table: {FullScreen: true

};
annotate service.Portfolio with {
    code @(
        Common.Text : description,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.CapexUsers with {
    ID @(
        Common.Text : Name,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

