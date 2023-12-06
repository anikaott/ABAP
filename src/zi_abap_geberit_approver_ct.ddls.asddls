@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Approver'

define view entity ZI_ABAP_GEBERIT_APPROVER_CT as select from zabap_employee
{
    key id as Id,
    concat_with_space(forname, surname, 1 ) as ApproverName

}
