using Departmentalservice from '../../services/index';

annotate Departmentalservice.Department with @(
UI :{
    LineItem : [
        {Value : code},
        {Value : name},
        {Value : description}
    ]
}
);

