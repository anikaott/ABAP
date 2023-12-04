
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Applicant'

define view entity ZI_ABAP_GEBERIT_APPLICANT_CT as select from zabap_employee
{    

    key id as Id,
    concat_with_space(forname, surname, 1) as ApplicantName

}
