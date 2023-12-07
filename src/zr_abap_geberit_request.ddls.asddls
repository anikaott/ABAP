@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_Request'
define view entity ZR_ABAP_GEBERIT_REQUEST as select from zabap_request
association to parent ZR_ABAP_GEBERIT_EMPLOYEE as _Employee on $projection.Applicant = _Employee.Id
association [1..1] to ZI_ABAP_GEBERIT_APPLICANT_CT as _ApplicantCT on $projection.Applicant = _ApplicantCT.Id
association [1..1] to ZI_ABAP_GEBERIT_APPROVER_CT as _ApproverCT on $projection.Approver = _ApproverCT.Id
association [1..1] to ZI_ABAP_GEBERIT_STATUS_CT as _StatusText on $projection.Id = _StatusText.Id
association [1..1] to ZI_ABAP_GEBERIT_EMPLOYEE_CT as _EmployeeCT on $projection.Id = _EmployeeCT.Id
{
   
   @ObjectModel.text.element: [ 'EmployeeName' ]
    key id as Id,
    @ObjectModel.text.element: [ 'ApplicantName' ]
    applicant as Applicant,
    @ObjectModel.text.element: [ 'ApproverName' ]
    approver as Approver,
    start_date as StartDate,
    end_date as EndDate,
    commentary as Commentary,
    @ObjectModel.text.element: [ 'StatusName' ]
    status as Status,
    
    
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
    case status when 'B' then 2
                when 'A' then 1
                when 'G' then 3
                else 0
    end as StatusCriticality,   
    
    case status when 'B' then _StatusText.StatusTextB
                when 'A' then _StatusText.StatusTextA
                when 'G' then _StatusText.StatusTextG
                else null
    end as StatusName,
    
     _ApplicantCT.ApplicantName as ApplicantName,
     _ApproverCT.ApproverName as ApproverName,
     _EmployeeCT.EmployeeName as EmployeeName,
    
    _Employee // Make association public
}
