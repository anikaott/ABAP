@EndUserText.label: 'ZC_Request'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ABAP_GEBERIT_REQUEST as projection on ZR_ABAP_GEBERIT_REQUEST
{
    key Id,
    Applicant,
    Approver,
    StartDate,
    EndDate,
    Commentary,
    Status,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    _Employee : redirected to parent ZC_ABAP_GEBERIT_EMPLOYEE
}
