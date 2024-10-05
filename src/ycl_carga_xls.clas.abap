CLASS ycl_carga_xls DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_carga_xls IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_fo      TYPE TABLE OF yses_file_table,
          lt_ses_db TYPE TABLE OF yses_db.

    lt_fo = VALUE #(
        ( end_user = 'usr1' status = '1' attachment = ''  mimetype = '.txt' filename = 'test' )

    ).
    DELETE FROM yses_file_table.
    MODIFY yses_file_table FROM TABLE @lt_fo.

    lt_ses_db = VALUE #(
        ( end_user = 'usr1' entrysheet = '24' ebeln = '20' ebelp = '10' )
    ).

    DELETE FROM yses_db .
    MODIFY yses_db  FROM TABLE @lt_ses_db.

    out->write( 'Test out run' ).

  ENDMETHOD.
ENDCLASS.
