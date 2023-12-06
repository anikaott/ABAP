
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Employee'


define view entity ZI_ABAP_GEBERIT_EMPLOYEE_CT as select from ZABAP_EMPLOYEE
{
    key id as Id,
    forname as Forname,
    surname as Surname,
    
    concat_with_space(forname, surname, 1 ) as EmployeeName

    
    
}
