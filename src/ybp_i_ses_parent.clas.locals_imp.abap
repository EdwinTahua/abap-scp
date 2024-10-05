CLASS lhc_File DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR File RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR File RESULT result.

    METHODS uploadExcelData FOR MODIFY
      IMPORTING keys FOR ACTION File~uploadExcelData RESULT result.

    METHODS fields FOR DETERMINE ON MODIFY
      IMPORTING keys FOR File~fields.

ENDCLASS.

CLASS lhc_File IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD uploadExcelData.

      READ ENTITIES OF yi_ses_parent IN LOCAL MODE
      ENTITY file
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(lt_inv).

    DATA(lv_attachment) = lt_inv[ 1 ]-attachment.

DATA: rows          TYPE STANDARD TABLE OF string,
          content       TYPE string,
*          conv          TYPE REF TO cl_abap_conv_in_ce,
          ls_excel_data TYPE zses_db,
          lt_excel_data TYPE STANDARD TABLE OF zses_db,
          lv_quantity   TYPE char10,
          lv_entrysheet TYPE ebeln.

*    conv = cl_abap_conv_in_ce=>create( input = lv_attachment ).
*    conv->read( IMPORTING data = content ).

    SPLIT content AT cl_abap_char_utilities=>cr_lf INTO TABLE rows.

    LOOP AT rows INTO DATA(ls_row).
      SPLIT ls_row AT ',' INTO ls_excel_data-entrysheet
                               ls_excel_data-ebeln
                               ls_excel_data-ebelp
                               ls_excel_data-ext_number
                               ls_excel_data-begdate
                               ls_excel_data-enddate
                               lv_quantity
                               "ls_attdata-BASE_UOM
                               ls_excel_data-fin_entry.

      ls_excel_data-entrysheet = lv_entrysheet = |{ ls_excel_data-entrysheet ALPHA = IN }|.
      ls_excel_data-ebeln      = |{ ls_excel_data-ebeln ALPHA = IN }|.
      ls_excel_data-ebelp      = |{ ls_excel_data-ebelp ALPHA = IN }|.
      ls_excel_data-quantity = CONV #( lv_quantity ).

      APPEND ls_excel_data TO lt_excel_data.
      CLEAR: ls_row, ls_excel_data.
ENDLOOP.

  ENDMETHOD.

  METHOD fields.

  SELECT SINGLE @abap_true FROM yses_file_table
*  UP TO 1 ROWS
  WHERE end_user = @SY-uname
    INTO @DATA(lv_valid).

*    ENDSELECT.

    IF lv_valid <> abap_true.
      INSERT yses_file_table FROM @( VALUE #( end_user = sy-uname ) ).
    ENDIF.

    MODIFY ENTITIES OF yi_ses_parent IN LOCAL MODE
    ENTITY file
    UPDATE FROM VALUE #( FOR key IN keys ( end_user        = key-end_user
                                           status          = ' ' " Accepted
                                           %control-status = if_abap_behv=>mk-on ) ).

    IF keys[ 1 ]-%is_draft = '01'.

      MODIFY ENTITIES OF yi_ses_parent IN LOCAL MODE
      ENTITY file
      EXECUTE uploadexceldata
      FROM CORRESPONDING #( keys ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_ExcelData DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ExcelData RESULT result.

    METHODS createSES FOR MODIFY
      IMPORTING keys FOR ACTION ExcelData~createSES RESULT result.

ENDCLASS.

CLASS lhc_ExcelData IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.

  METHOD createSES.

READ ENTITIES OF yi_ses_parent IN LOCAL MODE
        ENTITY exceldata
        ALL FIELDS WITH
        CORRESPONDING #( keys )
        RESULT DATA(lt_data).

*    DATA:
*      ls_header_data TYPE i_serviceentrysheettp_2,
*      ls_item_data   TYPE i_serviceentrysheetitemtp_2,

*      lt_header_crt  TYPE TABLE FOR CREATE i_serviceentrysheettp_2\\serviceentrysheet,
*      lt_item_cba    TYPE TABLE FOR CREATE i_serviceentrysheettp_2\\serviceentrysheet\_serviceentrysheetitem.

* Create SES with reference to a Service Purchase Order Item

*--- Prepare Header Data
*    ls_header_data-serviceentrysheetname  = 'Demo SES'.
*    ls_header_data-purchaseorder          = `4500000286`.
*    ls_header_data-sesoriginobjecttype    = `EX`.
*
**--- Prepare Item Data
*    ls_item_data-purchaseorderitem              = '00010'.
*    ls_item_data-confirmedquantity              = '1'.
*    ls_item_data-accountassignmentcategory      = 'K'.
*    ls_item_data-serviceperformancedate         = '20230207'.
*    ls_item_data-multipleacctassgmtdistribution = '0'.


*--- Prepare Payload
*    APPEND INITIAL LINE TO lt_header_crt ASSIGNING FIELD-SYMBOL(<ls_hdr_crt>).
*    <ls_hdr_crt> = CORRESPONDING #( ls_header_data CHANGING CONTROL ).
*    <ls_hdr_crt>-%cid     = `HEADER_1` .
*
*    APPEND INITIAL LINE TO lt_item_cba ASSIGNING FIELD-SYMBOL(<ls_itm_cba>).
*    <ls_itm_cba>-%cid_ref = 'HEADER_1'.
*
*    APPEND INITIAL LINE TO <ls_itm_cba>-%target ASSIGNING FIELD-SYMBOL(<item_data>).
*    <item_data>       = CORRESPONDING #( ls_item_data CHANGING CONTROL ).
*    <item_data>-%cid  = 'Item_1'.

*
*    MODIFY ENTITIES OF i_serviceentrysheettp_2
*      ENTITY serviceentrysheet
*        CREATE
*          FROM lt_header_crt
*         CREATE BY \_serviceentrysheetitem
*          FROM  lt_item_cba
*      FAILED DATA(ls_failed_crt)
*      REPORTED DATA(ls_reported_crt)
*      MAPPED DATA(ls_mapped_crt).

  ENDMETHOD.

ENDCLASS.
