@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Status'

define view entity ZI_ABAP_GEBERIT_STATUS_CT as select from zabap_request
{

   key id as Id,
   status as Status,
   
   'Declined' as StatusTextA,
   'Approved' as StatusTextB,
   'Requested' as StatusTextG
    
    
}
