using com.sap as demo from '../../../db/index';

service EmployeesService {
    entity Employees as projection on demo.employee.Employees actions {
        @(Common.SideEffects : {
            TargetProperties : ['status_ID']
            },
           cds.odata.bindingparameter.name : '_it',
           Core.OperationAvailable         : _it.isActive
        )
        action Deactivate() returns Employees;
        @(Common.SideEffects : {
            TargetProperties : ['status_ID']
            },
           cds.odata.bindingparameter.name : '_it',
           Core.OperationAvailable         : _it.isInActive
        )
        action Activate(  @(Common : {FieldControl : #ReadOnly})
                           @title                    :   'Activation Note'
                           @UI.ParameterDefaultValue : 'Activated'
                            note : String, 
                           @title  :   'Activation Date'               
                           date : Date
                           ) returns Employees;
    };

    entity Company as projection on demo.company.Companies;
}