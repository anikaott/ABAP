@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_Demand'
define view entity ZR_ABAP_GEBERIT_DEMAND as select from zabap_demand
association to parent ZR_ABAP_GEBERIT_EMPLOYEE as _Employee on $projection.Employee = _Employee.Id // NOCHMAL ANSCHAUEN - MUSS ES EMPLOYEE SEIN ?
{
    key id as Id,
    employee as Employee,
    date_year as DateYear,
    vacation_days as VacationDays,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    _Employee
}
