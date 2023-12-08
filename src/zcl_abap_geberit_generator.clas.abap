CLASS zcl_abap_geberit_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap_geberit_generator IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

DATA employees TYPE TABLE OF zabap_employee. "List<Travel> travels = new ArrayList<>();
DATA employee TYPE zabap_employee.  "Travel travel = new Travel();

DATA demands TYPE TABLE OF zabap_demand.
DATA demand TYPE zabap_demand.

DATA requests TYPE TABLE OF zabap_request.
DATA request TYPE zabap_request.

DELETE FROM zabap_employee.
DELETE FROM zabap_demand.
DELETE FROM zabap_request.
DELETE FROM zabap_geberit_d.
DELETE FROM zabap_demand_d.
DELETE FROM zabap_request_d.
"-------------------EMPLOYEE-----------------"

DATA hans TYPE sysuuid_x16.
employee-client = sy-mandt.
hans = cl_system_uuid=>create_uuid_x16_static(  ).
employee-id = hans.
employee-employee_number = '000001'.
employee-forname = 'Hans'.
employee-surname = 'Maier'.
employee-entry_date = '20000501'.
GET TIME STAMP FIELD employee-created_at.
employee-created_by = 'GENERATOR'.
GET TIME STAMP FIELD employee-last_changed_at.
APPEND employee to employees.

DATA lisa TYPE sysuuid_x16.
employee-client = sy-mandt.
lisa = cl_system_uuid=>create_uuid_x16_static(  ).
employee-id = lisa.
employee-employee_number = '000002'.
employee-forname = 'Lisa'.
employee-surname = 'Mueller'.
employee-entry_date = '20100701'.
GET TIME STAMP FIELD employee-created_at.
employee-created_by = 'GENERATOR'.
GET TIME STAMP FIELD employee-last_changed_at.
APPEND employee to employees.

DATA petra TYPE sysuuid_x16.
employee-client = sy-mandt.
petra = cl_system_uuid=>create_uuid_x16_static(  ).
employee-id = petra.
employee-employee_number = '000003'.
employee-forname = 'Petra'.
employee-surname = 'Schmid'.
employee-entry_date = '20221001'.
GET TIME STAMP FIELD employee-created_at.
employee-created_by = 'GENERATOR'.
GET TIME STAMP FIELD employee-last_changed_at.
APPEND employee to employees.

"----------------DEMAND---------------------"

demand-client = sy-mandt.
demand-id = cl_system_uuid=>create_uuid_x16_static(  ).
demand-employee = hans.
demand-date_year = '2022'.
demand-vacation_days = '30'.
GET TIME STAMP FIELD demand-created_at.
demand-created_by = 'GENERATOR'.
GET TIME STAMP FIELD demand-last_changed_at.
APPEND demand to demands.

demand-client = sy-mandt.
demand-id = cl_system_uuid=>create_uuid_x16_static(  ).
*employee-id = hans.
demand-employee = hans.
demand-date_year = '2023'.
demand-vacation_days = '30'.
GET TIME STAMP FIELD demand-created_at.
demand-created_by = 'GENERATOR'.
GET TIME STAMP FIELD demand-last_changed_at.
APPEND demand to demands.


demand-client = sy-mandt.
demand-id = cl_system_uuid=>create_uuid_x16_static(  ).
demand-employee = lisa.
demand-date_year = '2023'.
demand-vacation_days = '30'.
GET TIME STAMP FIELD demand-created_at.
demand-created_by = 'GENERATOR'.
GET TIME STAMP FIELD demand-last_changed_at.
APPEND demand to demands.

demand-client = sy-mandt.
demand-id = cl_system_uuid=>create_uuid_x16_static(  ).
demand-employee = petra.
demand-date_year = '2023'.
demand-vacation_days = '7'.
GET TIME STAMP FIELD demand-created_at.
demand-created_by = 'GENERATOR'.
GET TIME STAMP FIELD demand-last_changed_at.
APPEND demand to demands.

"---------------REQUEST-----------------"

request-client = sy-mandt.
request-id = cl_system_uuid=>create_uuid_x16_static(  ).
request-applicant = hans.
request-start_date = '20220701'.
request-end_date = '20220710'.
request-approver = lisa.
request-commentary = 'Sommerurlaub'.
request-status = 'G'.
request-vacation_days = '6'.
GET TIME STAMP FIELD request-created_at.
request-created_by = 'GENERATOR'.
GET TIME STAMP FIELD request-last_changed_at.
APPEND request to requests.

request-client = sy-mandt.
request-id = cl_system_uuid=>create_uuid_x16_static(  ).
request-applicant = hans.
request-start_date = '20221227'.
request-end_date = '20221230'.
request-approver = lisa.
request-commentary = 'Weihnachtsurlaub'.
request-status = 'A'.
request-vacation_days = '4'.
GET TIME STAMP FIELD request-created_at.
request-created_by = 'GENERATOR'.
GET TIME STAMP FIELD request-last_changed_at.
APPEND request to requests.

request-client = sy-mandt.
request-id = cl_system_uuid=>create_uuid_x16_static(  ).
request-applicant = hans.
request-start_date = '20221228'.
request-end_date = '20221230'.
request-approver = lisa.
request-commentary = 'Weihnachtsurlaub (2. Versuch)'.
request-status = 'G'.
request-vacation_days = '3'.
GET TIME STAMP FIELD request-created_at.
request-created_by = 'GENERATOR'.
GET TIME STAMP FIELD request-last_changed_at.
APPEND request to requests.

request-client = sy-mandt.
request-id = cl_system_uuid=>create_uuid_x16_static(  ).
request-applicant = hans.
request-start_date = '20230527'.
request-end_date = '20230614'.
request-approver = lisa.
request-commentary = ' '.
request-status = 'Genehmigt'.
request-vacation_days = '13'.
GET TIME STAMP FIELD request-created_at.
request-created_by = 'GENERATOR'.
GET TIME STAMP FIELD request-last_changed_at.
APPEND request to requests.

request-client = sy-mandt.
request-id = cl_system_uuid=>create_uuid_x16_static(  ).
request-applicant = hans.
request-start_date = '20231220'.
request-end_date = '20231231'.
request-approver = lisa.
request-commentary = 'Winterurlaub'.
request-status = 'B'.
request-vacation_days = '6'.
GET TIME STAMP FIELD request-created_at.
request-created_by = 'GENERATOR'.
GET TIME STAMP FIELD request-last_changed_at.
APPEND request to requests.

request-client = sy-mandt.
request-id = cl_system_uuid=>create_uuid_x16_static(  ).
request-applicant = petra.
request-start_date = '20231227'.
request-end_date = '20231231'.
request-approver = hans.
request-commentary = 'Weinachtsurlaub'.
request-status = 'B'.
GET TIME STAMP FIELD request-created_at.
request-created_by = 'GENERATOR'.
GET TIME STAMP FIELD request-last_changed_at.
APPEND request to requests.


INSERT zabap_employee FROM TABLE  @Employees.
INSERT zabap_demand FROM TABLE @Demands.
INSERT zabap_request FROM TABLE @Requests.



ENDMETHOD.
ENDCLASS.
