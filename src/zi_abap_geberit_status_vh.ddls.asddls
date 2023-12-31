
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'value help for status'

define view entity ZI_ABAP_GEBERIT_STATUS_VH as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZABAP_GEBERIT_STATUS'  )
{

   @UI.hidden: true
    key domain_name,
    @UI.hidden: true
    key value_position,
    @UI.hidden: true
    key language,
    @EndUserText:{ label: 'Status', quickInfo: 'Status' }
    //@UI.lineItem: [{ position: 10 }]
    value_low as Status,
    @EndUserText: { label: 'Status Text', quickInfo: 'Status Text' }
    text as StatusText
    
}

  where
       language = $session.system_language
