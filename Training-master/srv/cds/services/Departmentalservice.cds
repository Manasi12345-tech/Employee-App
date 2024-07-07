using com.sap as demo from '../../../db/index';

service Departmentalservice {

    entity Department as projection on demo.department.Department;

}