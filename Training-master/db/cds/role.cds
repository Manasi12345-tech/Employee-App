namespace com.sap.role;

using { sap.common.CodeList } from '@sap/cds/common';

type Role : Association to one Roles;

entity Roles : CodeList {
  key ID   : String;
}