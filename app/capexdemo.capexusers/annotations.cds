using AdminService as service from '../../srv/admin';
annotate service.CapexUsers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : userID,
                Label : '{i18n>UserID}',
            },
           
            {
                $Type : 'UI.DataField',
                Label : '{i18n>FullName}',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ManagerId}',
                Value : manager_ID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : userID,
            Label : '{i18n>UserID}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Name}',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Value : manager_ID,
            Label : '{i18n>ManagerName}',
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
            Label : '{i18n>LastChangedBy}',
        },
    ],    UI.TableSettings             : {
        GrowingEnabled  : true,
        GrowingThreshold: 100,
        InlineDelete    : false
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : userID,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
    },

);

annotate service.CapexUsers with {
    manager_ID @(
        Common.Text : manager.Name,
        Common.Text.@UI.TextArrangement : #TextFirst,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CapexUsers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : manager_ID,
                    ValueListProperty : 'userID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};
annotate service.CapexUsers with @UI.Table: {FullScreen: true

};



