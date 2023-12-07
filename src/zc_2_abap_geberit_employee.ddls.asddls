@EndUserText.label: 'ZC_2_Employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_2_ABAP_GEBERIT_EMPLOYEE
  provider contract transactional_query 
  as projection on ZR_ABAP_GEBERIT_EMPLOYEE
{
    key Id,
    EmployeeNumber,
    Forname,
    Surname,
    EntryDate,
    
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    EmployeeName,
    
    _Requests : redirected to composition child ZC_2_ABAP_GEBERIT_REQUEST
    
}
