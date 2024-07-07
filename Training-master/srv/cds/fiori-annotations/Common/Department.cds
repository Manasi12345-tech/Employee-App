using from '../../../../db/index';

annotate com.sap.department.Department with {
    code 
    @Common : { 
        Label : 'Department Code',
        TextArrangement : #TextFirst,
        Text : 'name',
    };

    name
    @Common : { 
        Label : 'Department Name',
        TextArrangement : #TextOnly,
        Text : 'name'
    };

    description
    @Common : { 
        Label : 'Department Description',
        TextArrangement : #TextOnly,
        Text : 'description'
    };
}