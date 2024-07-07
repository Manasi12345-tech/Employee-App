using com.sap as db from '../../../../db/cds/index';

annotate db.role.Roles   with {
    ID 
    @Common : {
        Label                    : 'ID',
        Text  : {
            $value                : ID,
           ![@UI.TextArrangement] : #TextOnly
            }
    };  
    name @Common : {
        Label        : 'Role'
    };
};


annotate db.role.Role with @(Common.ValueListWithFixedValues);