CLASS ycl_carga_fo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_carga_fo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_fo      TYPE TABLE OF ytb_freightorder,
          lt_fo_pack TYPE TABLE OF ytb_freight_pack.

    lt_fo = VALUE #(
        ( frightorderno = '1' totalamount = '200.33' currency = 'USD'  prioritydelivery = 'X' )
        ( frightorderno = '2' totalamount = '800.33' currency = 'USD'  prioritydelivery = 'X' )
        ( frightorderno = '3' totalamount = '1000.33' currency = 'USD'  prioritydelivery = 'X' )
        ( frightorderno = '4' totalamount = '2000.33' currency = 'USD'  prioritydelivery = 'X' )
    ).
    DELETE FROM ytb_freightorder.
    MODIFY ytb_freightorder FROM TABLE @lt_fo.

    lt_fo_pack = VALUE #(
        ( frightorderno = '1' packageno = '1' packagedetails = 'demo1' material = '1' materialqty = '8'  uom = '' )
        ( frightorderno = '1' packageno = '2' packagedetails = 'demo1' material = '1' materialqty = '10'  uom = '' )
        ( frightorderno = '1' packageno = '3' packagedetails = 'demo1' material = '1' materialqty = '100'  uom = '' )
        ( frightorderno = '1' packageno = '4' packagedetails = 'demo1' material = '1' materialqty = '20'  uom = '' )

        ( frightorderno = '2' packageno = '1' packagedetails = 'dem' material = '1' materialqty = '800'  uom = '' )
        ( frightorderno = '3' packageno = '2' packagedetails = 'demo' material = '1' materialqty = '500'  uom = '' )
        ( frightorderno = '4' packageno = '3' packagedetails = 'demo' material = '1' materialqty = '100'  uom = '' )
        ( frightorderno = '4' packageno = '4' packagedetails = 'demo2' material = '1' materialqty = '200'  uom = '' )
    ).

    DELETE FROM ytb_freight_pack .
    MODIFY ytb_freight_pack  FROM TABLE @lt_fo_pack.

    out->write( 'Test out run' ).

  ENDMETHOD.
ENDCLASS.
