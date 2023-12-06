
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'value help for applicant'

define view entity ZI_ABAP_GEBERIT_APPLICANT_VH as select from zabap_employee
{
    key id as Id,
    employee_number as EmployeeNumber,
    forname as Forname,
    surname as Surname,
    entry_date as EntryDate
}
