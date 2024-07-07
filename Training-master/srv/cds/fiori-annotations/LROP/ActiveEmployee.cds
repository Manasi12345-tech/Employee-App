using EmployeesActiveService from '../../services/NonDraftService';

annotate EmployeesActiveService.EmployeesActive with {
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
        TextArrangement : #TextFirst
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