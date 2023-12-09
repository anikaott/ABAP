CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Employee RESULT result.

    METHODS get_instance_authorizations_1 FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Request RESULT result.

     METHODS approverequest FOR MODIFY
      IMPORTING keys FOR ACTION request~ApproveRequest RESULT result.

      METHODS declinerequest FOR MODIFY
      IMPORTING keys FOR ACTION request~DeclineRequest RESULT result.

      METHODS determinestatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR request~determinestatus.

     METHODS determinestatusrequestcomment FOR DETERMINE ON MODIFY
       IMPORTING keys FOR request~determinestatusrequestcomment.

     METHODS validatedates FOR VALIDATE ON SAVE
       IMPORTING keys FOR request~ValidateDates.


      METHODS determinevacationdays FOR DETERMINE ON MODIFY
      IMPORTING keys FOR request~DetermineVacationDays.

      METHODS ValidateNotEnoughVacationDays FOR VALIDATE ON SAVE
       IMPORTING keys FOR request~ValidateNotEnoughVacationDays.


   " METHODS notenough FOR MODIFY
"IMPORTING keys FOR ACTION employee~notenough RESULT result.

ENDCLASS.

 CLASS lhc_Employee IMPLEMENTATION.


  METHOD determinestatus.
  READ ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
  FIELDS ( Status )
  WITH CORRESPONDING #( keys )
  RESULT DATA(requests).

  MODIFY ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
  UPDATE FIELDS ( Status )
  WITH VALUE #( FOR r IN requests
  (   %tky = r-%tky
  Status = 'B' ) ).
  ENDMETHOD.



    METHOD determinestatusrequestcomment.
  READ ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
  FIELDS ( Status )
  WITH CORRESPONDING #( keys )
  RESULT DATA(requests).

  MODIFY ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
  UPDATE FIELDS ( Status )
  WITH VALUE #( FOR r IN requests
  (   %tky = r-%tky
  Status = 'B' ) ).
  ENDMETHOD.



  METHOD approverequest.
    DATA message TYPE REF To ZCM_ABAP_GEBERIT.

  READ ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
  ALL FIELDS
  WITH CORRESPONDING #( keys )
  RESULT DATA(requests).

  LOOP AT requests REFERENCE INTO DATA(request).
  IF request->Status = 'G'.
  message = NEW zcm_abap_geberit(
  textid = zcm_abap_geberit=>request_already_approved
  commentary = request->Commentary ) .
  APPEND VALUE #( %tky = request->%tky
  %element = VALUE #( Status = if_abap_behv=>mk-on )
  %msg = message ) TO reported-request.
  APPEND VALUE #( %tky = request->%tky ) TO failed-request.
  DELETE requests INDEX sy-tabix.
  CONTINUE.
  ENDIF.

    IF request->Status = 'A'.
  message = NEW zcm_abap_geberit(
  severity = if_abap_behv_message=>severity-error
  textid = zcm_abap_geberit=>request_already_declined
  commentary = request->Commentary ) .
  APPEND VALUE #( %tky = request->%tky
  %element = VALUE #( Status = if_abap_behv=>mk-on )
  %msg = message ) TO reported-request.
  APPEND VALUE #( %tky = request->%tky ) TO failed-request.
  DELETE requests INDEX sy-tabix.
  CONTINUE.
  ENDIF.

  request->Status = 'G'.
  message = NEW zcm_abap_geberit(
  severity = if_abap_behv_message=>severity-success
  textid = zcm_abap_geberit=>request_successfully_approved
  commentary = request->Commentary ) .
  APPEND VALUE #( %tky = request->%tky
  %element = VALUE #( Status = if_abap_behv=>mk-on )
  %msg = message ) TO reported-request.
  ENDLOOP.

  MODIFY ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
  UPDATE FIELDS ( Status )
  WITH VALUE #( FOR r in requests
  ( %tky = r-%tky Status = r-Status ) ).

  result = VALUE #( FOR r in requests
  ( %tky = r-%tky
  %param = r ) ).
  ENDMETHOD.








  METHOD declinerequest.
    DATA message TYPE REF To ZCM_ABAP_GEBERIT.

  READ ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
  ALL FIELDS
  WITH CORRESPONDING #( keys )
  RESULT DATA(requests).

  LOOP AT requests REFERENCE INTO DATA(request).
  IF request->Status = 'A'.
  message = NEW zcm_abap_geberit(
  textid = zcm_abap_geberit=>request_already_declined
  commentary = request->Commentary ) .
  APPEND VALUE #( %tky = request->%tky
  %element = VALUE #( Status = if_abap_behv=>mk-on )
  %msg = message ) TO reported-request.
  APPEND VALUE #( %tky = request->%tky ) TO failed-request.
  DELETE requests INDEX sy-tabix.
  CONTINUE.
  ENDIF.

    IF request->Status = 'G'.
  message = NEW zcm_abap_geberit(
  severity = if_abap_behv_message=>severity-error
  textid = zcm_abap_geberit=>request_already_approved
  commentary = request->Commentary ) .
  APPEND VALUE #( %tky = request->%tky
  %element = VALUE #( Status = if_abap_behv=>mk-on )
  %msg = message ) TO reported-request.
  APPEND VALUE #( %tky = request->%tky ) TO failed-request.
  DELETE requests INDEX sy-tabix.
  CONTINUE.
  ENDIF.

  request->Status = 'A'.

  message = NEW zcm_abap_geberit(
      severity = if_abap_behv_message=>severity-success
      textid = zcm_abap_geberit=>request_successfully_declined
      commentary = request->Commentary
  ) .

  APPEND VALUE #( %tky = request->%tky
  %element = VALUE #( Status = if_abap_behv=>mk-on )
  %msg = message ) TO reported-request.
  ENDLOOP.

  MODIFY ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
  UPDATE FIELDS ( Status )
  WITH VALUE #( FOR r in requests
  ( %tky = r-%tky Status = r-Status ) ).

  result = VALUE #( FOR r in requests
  ( %tky = r-%tky
  %param = r ) ).
  ENDMETHOD.







  METHOD validatedates.
  DATA message TYPE REF TO zcm_abap_geberit.

  READ ENTITY IN LOCAL MODE zr_abap_geberit_request
  FIELDS ( StartDate EndDate )
  WITH CORRESPONDING #( keys )
  RESULT DATA(requests).

  LOOP AT requests INTO DATA(request).

  IF request-EndDate < request-StartDate.
  message = NEW zcm_abap_geberit( textid = zcm_abap_geberit=>invalid_dates ).
  APPEND VALUE #( %tky = request-%tky
  %msg = message ) TO reported-request.
  APPEND VALUE #( %tky = request-%tky ) to failed-request.
  ENDIF.
  ENDLOOP.
  ENDMETHOD.




      METHOD determinevacationdays.

    "Read Requests
    READ ENTITY IN LOCAL MODE zr_abap_geberit_request
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(requests).

    LOOP AT requests INTO DATA(request).

      "Calculation of Vacation Days
      TRY.
          DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
        CATCH cx_fhc_runtime.
          RETURN.
      ENDTRY.

      TRY.
          DATA(working_days) = calendar->calc_workingdays_between_dates( iv_start = request-StartDate iv_end = request-EndDate ).
        CATCH cx_fhc_runtime.
          RETURN.
      ENDTRY.

      "Modify Requests
      MODIFY ENTITY IN LOCAL MODE zr_abap_geberit_request
      UPDATE FIELDS ( VacationDays )
      WITH VALUE #( FOR r IN requests
      ( %tky = r-%tky
      VacationDays = working_days + 1 ) ).

    ENDLOOP.

  ENDMETHOD.




  METHOD ValidateNotEnoughVacationDays.

    DATA message TYPE REF TO zcm_abap_geberit.

    " Read Vacation Applications
    READ ENTITY IN LOCAL MODE ZR_ABAP_GEBERIT_REQUEST
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT DATA(requests).

    " Process Vacation Applications
       LOOP AT requests INTO DATA(request).

      " Calculate the necessary Vacation Days
      TRY.
          DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
        CATCH cx_fhc_runtime.

          "handle exception
          RETURN.
      ENDTRY.

      TRY.
          DATA(VacationDays) = calendar->calc_workingdays_between_dates( iv_start = request-startdate iv_end = request-enddate ) + 1.
        CATCH cx_fhc_runtime.

          "handle exception
          RETURN.
      ENDTRY.

      SELECT SINGLE FROM zabap_demand FIELDS SUM( vacation_days ) WHERE employee = @request-applicant INTO @DATA(vac_all_days).
      SELECT SINGLE FROM zabap_request FIELDS SUM( vacation_days ) WHERE applicant = @request-applicant AND status = 'B' INTO @DATA(vac_all_planned_b_days).
      SELECT SINGLE FROM zabap_request FIELDS SUM( vacation_days ) WHERE applicant = @request-applicant AND status = 'G' INTO @DATA(vac_all_planned_g_days).

      DATA(free_vac_days) = vac_all_days - vac_all_planned_b_days - vac_all_planned_g_days.

      " Validate Vacation Application and create Error Message
      IF vacationdays > free_vac_days.
        message = NEW zcm_abap_geberit(
            severity = if_abap_behv_message=>severity-error
            textid = zcm_abap_geberit=>not_enough_vac_days commentary = request-Commentary ).
        APPEND VALUE #( %tky     = request-%tky
                        %element = VALUE #( status = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-request.
        APPEND VALUE #( %tky = request-%tky ) TO failed-request.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.














METHOD get_instance_authorizations.
ENDMETHOD.



METHOD get_instance_authorizations_1.
ENDMETHOD.
ENDCLASS.
