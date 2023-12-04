@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_Request'
define view entity ZR_ABAP_GEBERIT_REQUEST as select from zabap_request
association to parent ZR_ABAP_GEBERIT_EMPLOYEE as _Employee on $projection.Applicant = _Employee.Id
association [1..1] to ZI_ABAP_GEBERIT_APPLICANT_CT as _ApplicantCT on $projection.Applicant = _ApplicantCT.Id
association [1..1] to ZI_ABAP_GEBERIT_APPROVER_CT as _ApproverCT on $projection.Approver = _ApproverCT.Id
{
    @EndUserText: { label: 'Request Id', quickInfo: 'Request Id'}
    key id as Id,
    @ObjectModel.text.element: [ 'ApplicantName' ]
    applicant as Applicant,
    @ObjectModel.text.element: [ 'ApproverName' ]
    approver as Approver,
    start_date as StartDate,
    end_date as EndDate,
    commentary as Commentary,
    status as Status,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    
    case status when 'B' then 2
                when 'A' then 1
                when 'G' then 3
                else 0
    end as StatusCriticality,   
    
     _ApplicantCT.ApplicantName as ApplicantName,
     _ApproverCT.ApproverName as ApproverName,
    
    _Employee // Make association public
}
