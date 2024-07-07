using EmployeesService from '../../services/DraftService';

annotate EmployeesService.Employees with {
    ID
    @UI.Hidden;

    address
    @Common.Label  : 'Address';

    birthDate
    @Common.Label  : 'Birth Date';

    collegeName
    @Common.Label  : 'College Name';

    email
    @Common.Label  : 'Email';

    endYear
    @Common.Label  : 'End Year';

    identifier
    @Common.FieldControl : #ReadOnly
    @Common.Label  : 'ID';

    mobile
    @Common.Label  : 'Mobile';

    name
    @Common.Label  : 'Name';

    role
    @Common.Label  : 'Role';

    startYear
    @Common.Label  : 'Start Year';

    status
    @Common.FieldControl : #Mandatory
    @Common.Label  : 'Status';

    company
    @Common.Label  : 'Company';

    status  @Common : 
    {
        Text            : status.name,
        TextArrangement : #TextSeparate
    };   

    company  @Common : 
    {
        Text            : company.name,
        TextArrangement : #TextFirst,
        ValueListMapping : {
        Label          : 'Company',
        CollectionPath : 'Companies',
        Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'ID',
                LocalDataProperty : company_ID
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'address'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'mobile'
            }
        ]
    }
    };

    role  @Common : 
    {
        Text            : role.name,
        TextArrangement : #TextOnly
    }; 

    @UI.Hidden @UI.HiddenFilter
    isHideActivateButton;

    @UI.Hidden
    isHideDeactivateButton;
}