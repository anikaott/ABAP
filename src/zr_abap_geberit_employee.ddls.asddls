@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_Employee'
define root view entity ZR_ABAP_GEBERIT_EMPLOYEE as select from zabap_employee
composition of ZR_ABAP_GEBERIT_DEMAND as _Demands
composition of ZR_ABAP_GEBERIT_REQUEST as _Requests
{
    @EndUserText: { label: 'Employee Id', quickInfo: 'Employee Id'}
    key id as Id,
    employee_number as EmployeeNumber,
    forname as Forname,
    surname as Surname,
    entry_date as EntryDate,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    //_association_name // Make association public
    
    _Demands,
    _Requests
}


