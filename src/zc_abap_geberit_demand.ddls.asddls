@EndUserText.label: 'ZC_Demand'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ABAP_GEBERIT_DEMAND as projection on ZR_ABAP_GEBERIT_DEMAND
{
    key Id,
    Employee,
    DateYear,
    VacationDays,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Employee : redirected to parent ZC_ABAP_GEBERIT_EMPLOYEE
}
