namespace com.sap.department;

using {com.sap.employee.Employees} from './index';

entity Department{
   Key code : String(5);
    name : String;
    description : String;
    employees : Composition of many Employees on employees.department = $self;
}

