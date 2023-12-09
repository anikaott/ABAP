@EndUserText.label: 'ZC_2_Request'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_2_ABAP_GEBERIT_REQUEST as projection on ZR_ABAP_GEBERIT_REQUEST
{
    key Id,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ABAP_GEBERIT_APPLICANT_VH', element: 'Id' } }]
    Applicant,
    Approver,
    StartDate,
    EndDate,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    Commentary,
    
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ABAP_GEBERIT_STATUS_VH', element: 'Status' } }]
    @ObjectModel.text.element: [ 'StatusName' ]
    Status,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    ApproverName,
    ApplicantName,
    
    StatusCriticality,
    EmployeeName,
    StatusName,
    
    _Employee : redirected to parent ZC_2_ABAP_GEBERIT_EMPLOYEE
}
