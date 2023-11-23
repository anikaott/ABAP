@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_Request'
define view entity ZR_ABAP_GEBERIT_REQUEST as select from zabap_request
association to parent ZR_ABAP_GEBERIT_EMPLOYEE as _Employee on $projection.Applicant = _Employee.Id
{
    key id as Id,
    applicant as Applicant,
    approver as Approver,
    start_date as StartDate,
    end_date as EndDate,
    commentary as Commentary,
    status as Status,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    _Employee // Make association public
}
