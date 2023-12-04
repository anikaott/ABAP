@EndUserText.label: 'ZC_Employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_ABAP_GEBERIT_EMPLOYEE
  provider contract transactional_query 
  as projection on ZR_ABAP_GEBERIT_EMPLOYEE
{
    key Id,
    EmployeeNumber,
    @Search.defaultSearchElement: true   // Description soll durchsucht werden 
    @Search.fuzzinessThreshold: 0.7  // wie exakt wird gesucht - 0 oder 1 - 1 -> genauuee suche - guter wert 0.7
    Forname,
    @Search.defaultSearchElement: true   // Description soll durchsucht werden 
    @Search.fuzzinessThreshold: 0.7  // wie exakt wird gesucht - 0 oder 1 - 1 -> genauuee suche - guter wert 0.7
    Surname,
    EntryDate,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    _Requests : redirected to composition child ZC_ABAP_GEBERIT_REQUEST,
    _Demands: redirected to composition child ZC_ABAP_GEBERIT_DEMAND
}
