using EmployeesActiveService from '../../services/NonDraftService';

annotate EmployeesActiveService.EmployeesActive with @(
    odata.draft.enabled : true,
    UI : {
        HeaderInfo : {
            TypeName : '{i18n>TITLE_EMPLOYEE}',
            TypeNamePlural : '{i18n>TITLE_EMPLOYEES}',
            Title : { $Type : 'UI.DataField', Value : identifier },
            Description : { $Type : 'UI.DataField', Value : name},
            ImageUrl : 'sap-icon://employee'
        },
        HeaderFacets: [
            {$Type : 'UI.ReferenceFacet', Target : '@UI.FieldGroup#HeaderDetails', Label : 'Form'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Status'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.FieldGroup#HeaderDetailsContact',Label : 'Contact'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Rating'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#RatingProgress'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.Chart#Donut'}
        ],
        FieldGroup#HeaderDetails:{
            Data  : [
                {$Type : 'UI.DataField', Value : identifier},
                {$Type : 'UI.DataField', Value : name}
            ]
        },
        FieldGroup#HeaderDetailsContact:{
            Data  : [
                {$Type : 'UI.DataField', Value : company_ID}
            ]
        },
        DataPoint#Status:{
            Value: status_ID,
            Criticality: status_ID,
            CriticalityRepresentation : #WithoutIcon,
            Title : 'Status'
        },
        DataPoint#Rating:{
            Value: rating,
            Title : 'Ratings',
            Visualization : #Rating
        },
        DataPoint#RatingProgress:{
            Value: rating,
            Visualization :#Progress,
            TargetValue : 5,
            Title : 'Rating Progress'
        },
        Chart#Donut : {
            ChartType : #Donut,
            Title : 'Stock',
            Measures : [
                rating,
            ],
            MeasureAttributes : [
                {
                    DataPoint : '@UI.DataPoint#rating',
                    Role : #Axis1,
                    Measure : rating,
                },
            ],
        },
        DataPoint #rating : {
            Value : rating,
            TargetValue : 5,
        }
    },
);