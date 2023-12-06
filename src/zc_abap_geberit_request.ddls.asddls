@EndUserText.label: 'ZC_Request'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ABAP_GEBERIT_REQUEST as projection on ZR_ABAP_GEBERIT_REQUEST
{
    key Id,
    Applicant,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ABAP_GEBERIT_APPROVER_VH', element: 'Id' } }]
    Approver,
    StartDate,
    EndDate,
    Commentary,
    Status,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    StatusName,
    StatusCriticality,
    ApproverName,
    ApplicantName,
    
    _Employee : redirected to parent ZC_ABAP_GEBERIT_EMPLOYEE
}
