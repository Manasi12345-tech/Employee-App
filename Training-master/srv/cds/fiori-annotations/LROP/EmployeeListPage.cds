using EmployeesService from '../../services/DraftService';

annotate EmployeesService.Employees with @(
    odata.draft.enabled : true,
    //to make the entity draft enabled and allow create.
     Capabilities: {
        SearchRestrictions.Searchable : true,//true if search bar is neeeded
        FilterRestrictions  : { 
            NonFilterableProperties : [//properties that shouldnot be shown in filter
                mobile,isHideDeactivateButton
            ],
            FilterExpressionRestrictions : [
                {//only one range will be allowed
                    Property          : 'birthDate',
                    AllowedExpressions : 'SingleRange'
                },
                {//multiple ranges will be allowed
                    Property          : 'startYear',
                    AllowedExpressions : 'MultiRange'
                },
                {//multiple values will be allowed
                    Property          : 'email',
                    AllowedExpressions : 'MultiValue'
                },
                {//searching using an expression will be allowed, eg:contains,startswith,endswith
                    Property          : 'collegeName',
                    AllowedExpressions : 'SearchExpression'
                },
                {//only  one value be allowed
                    Property          : 'name',
                    AllowedExpressions : 'SingleValue'
                },
                {
                    Property          : 'company_ID',
                    AllowedExpressions : 'MultiValue'
                },
                {
                    Property          : 'status_ID',
                    AllowedExpressions : 'MultiRangeOrSearchExpression'

                }
            ]
        },
        SortRestrictions : {
        NonSortableProperties : [//properties that shouldnot be shown in sort in settings button
            collegeName
        ],
        AscendingOnlyProperties : [//properties that should be shown in sort but only in ascending order
            startYear
        ],
        DescendingOnlyProperties : [//properties that should be shown in sort but only in descending order
            birthDate
        ]
    },
    DeleteRestrictions.Deletable : false,
    SkipSupported : false,//wheather $skip is supported or not
    },
    
    Common.SemanticKey  : [identifier],
    UI: {
        PresentationVariant: {
            RequestAtLeast:[mobile],
            Visualizations: ['@UI.LineItem'],
            SortOrder : [
                {
                    Property   : 'modifiedAt',
                    Descending : true
                }
            ]
        },
        SelectionVariant #All : {
            Text: '{i18n>ALL}',
            SelectOptions: [
                {
                    $Type     : 'UI.SelectOptionType',
                    PropertyName : status_ID,
                    Ranges: [{
                        $Type : 'UI.SelectionRangeType',
                        Sign : #I,
                        Option: #BT,
                        Low: 0,
                        High: 3
                    }
                    ]
                }
            ]
        }, 
        SelectionVariant #Active : {
            Text: 'Active',
            SelectOptions: [
                {
                    $Type     : 'UI.SelectOptionType',
                    PropertyName : status_ID,
                    Ranges: [{
                        $Type : 'UI.SelectionRangeType',
                        Sign : #I,
                        Option : #EQ,
                        Low : 3
                    }
                    ]
                }
            ]
        }, 
        SelectionVariant #New : {
            Text: 'New',
            SelectOptions: [
                {
                    $Type     : 'UI.SelectOptionType',
                    PropertyName : status_ID,
                    Ranges: [{
                        $Type : 'UI.SelectionRangeType',
                        Sign : #I,
                        Option : #EQ,
                        Low : 2
                    }
                    ]
                }
            ]
        },
        SelectionFields: [ birthDate, startYear, company_ID],//only these filters will come by default on listpage
        LineItem: {
            $value :[
                {$Type : 'UI.DataField', Value: identifier},
                {$Type : 'UI.DataField', Value: name},
                {$Type : 'UI.DataField', Value: birthDate},
                {
                    $Type: 'UI.DataField',
                    Value: status_ID,
                    Criticality: status_ID,
                    CriticalityRepresentation : #WithIcon
                }, 
                {   
                    $Type: 'UI.DataFieldWithUrl', 
                    Value: email,
                    Label: 'Email',
                    Url:'mailto:{email}'
                }, 
                {   
                    $Type: 'UI.DataFieldForAnnotation', 
                    Target: '@UI.FieldGroup#Role',
                    Label: 'Email'
                }, 
                {
                    $Type: 'UI.DataFieldForAction', //to display button in list page
                    Label: 'Activate',
                    Action: 'EmployeesService.Activate',//action specified in service to be invoked on click of button
                    Criticality: #Positive//color of button
                },
                {
                    $Type: 'UI.DataFieldForAction', 
                    Label: 'Deactivate',
                    Action: 'EmployeesService.Deactivate',
                    Criticality: #Negative
                }       
            ]
        },

        FieldGroup #Role : {Data: [
            {
                $Type: 'UI.DataField',
                Value: role.name
            },
            {
                $Type: 'UI.DataField',
                Value: role.ID
            }
        ]}
    }
);
