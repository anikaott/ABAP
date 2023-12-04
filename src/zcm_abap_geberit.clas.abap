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
      begin of enddate_before_startdate,
        msgid type symsgid value 'ZABAP_GEBERIT_MC',
        msgno type symsgno value '001',
        attr1 type scx_attrname value 'DESCRIPTION',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of enddate_before_startdate.

    constants:
      begin of not_enough_vacation_days,
        msgid type symsgid value 'ZABAP_GEBERIT_MC',
        msgno type symsgno value '001',
        attr1 type scx_attrname value 'DESCRIPTION',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of not_enough_vacation_days.

    data description type zabap_geberit_commentary.

    METHODS constructor
      IMPORTING
        severity  type if_abap_behv_message=>t_severity
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        description type zabap_geberit_commentary OPTIONAL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.





CLASS zcm_abap_geberit IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->description = description.
    if_abap_behv_message~m_severity = severity.
  ENDMETHOD.

ENDCLASS.
