@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'value help for approver'
define view entity ZI_ABAP_GEBERIT_APPROVER_VH 
as select from zabap_employee
{
    key id as Id,
    employee_number as EmployeeNumber,
    forname as Forname,
    surname as Surname,
    entry_date as EntryDate
}
