CLASS zcm_abap_geberit DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

        constants:
       BEGIN OF request_successfully_approved,
        msgid type symsgid value 'ZABAP_GEBERIT_MC',
        msgno type symsgno value '001',
        attr1 type scx_attrname value 'COMMENTARY',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
       END OF request_successfully_approved.


         constants:
       BEGIN OF request_successfully_declined,
        msgid type symsgid value 'ZABAP_GEBERIT_MC',
        msgno type symsgno value '002',
        attr1 type scx_attrname value 'COMMENTARY',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
       END OF request_successfully_declined.





         constants:
       BEGIN OF request_already_approved,
        msgid type symsgid value 'ZABAP_GEBERIT_MC',
        msgno type symsgno value '003',
        attr1 type scx_attrname value 'COMMENTARY',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
       END OF request_already_approved.




         constants:
       BEGIN OF request_already_declined,
        msgid type symsgid value 'ZABAP_GEBERIT_MC',
        msgno type symsgno value '004',
        attr1 type scx_attrname value 'COMMENTARY',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
       END OF request_already_declined.






        constants:
       BEGIN OF invalid_dates,
        msgid type symsgid value 'ZABAP_GEBERIT_MC',
        msgno type symsgno value '005',
        attr1 type scx_attrname value 'COMMENTARY',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
       END OF invalid_dates.



     constants:
       BEGIN OF not_enough_vac_days,
        msgid type symsgid value 'ZABAP_GEBERIT_MC',
        msgno type symsgno value '006',
        attr1 type scx_attrname value 'COMMENTARY',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
       END OF not_enough_vac_days.




*      constants:
*      begin of enddate_before_startdate,
*        msgid type symsgid value 'ZABAP_GEBERIT_MC',
*        msgno type symsgno value '001',
*        attr1 type scx_attrname value 'DESCRIPTION',
*        attr2 type scx_attrname value '',
*        attr3 type scx_attrname value '',
*        attr4 type scx_attrname value '',
*      end of enddate_before_startdate.
*
*    constants:
*      begin of not_enough_vacation_days,
*        msgid type symsgid value 'ZABAP_GEBERIT_MC',
*        msgno type symsgno value '001',
*        attr1 type scx_attrname value 'DESCRIPTION',
*        attr2 type scx_attrname value '',
*        attr3 type scx_attrname value '',
*        attr4 type scx_attrname value '',
*      end of not_enough_vacation_days.
*
*





    DATA commentary type zabap_request-commentary.
    METHODS constructor
      IMPORTING
        severity  type if_abap_behv_message=>t_severity DEFAULT
        if_abap_behv_message=>severity-error
        !textid   LIKE if_t100_message=>t100key DEFAULT
        if_t100_message=>default_textid
        !previous LIKE previous OPTIONAL
        commentary type zabap_request-commentary OPTIONAL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.






CLASS zcm_abap_geberit IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
      if_t100_message~t100key = textid.
      if_abap_behv_message~m_severity = severity.
      me->commentary = commentary.


  ENDMETHOD.

ENDCLASS.
