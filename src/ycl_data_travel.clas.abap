CLASS ycl_data_travel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_data_travel IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

delete from ytb_travel_et.
    delete from ytb_travel_etd.


    insert ytb_travel_et from (
      select from /dmo/travel fields
        " client
        uuid( ) as travel_uuid,
        travel_id,
        agency_id,
        customer_id,
        begin_date,
        end_date,
        booking_fee,
        total_price,
        currency_code,
        description,
        case status when 'B' then 'A'
                    when 'P' then 'O'
                    when 'N' then 'O'
                    else 'X' end as overall_status,
        createdby as local_created_by,
        createdat as local_created_at,
        lastchangedby as local_last_changed_by,
        lastchangedat as local_last_changed_at,
        lastchangedat as last_changed_at
    ).

    if sy-subrc eq 0.
      out->write( |Travel:...{ sy-dbcnt } rows inserted.| ).
    endif.

    delete from ytb_booking.
    delete from ytb_bookingd.

    insert ytb_booking from (
        select
          from /dmo/booking
            join ytb_travel_et on /dmo/booking~travel_id = ytb_travel_et~travel_id
            join /dmo/travel on /dmo/travel~travel_id = /dmo/booking~travel_id
          fields  "client,
                  uuid( ) as booking_uuid,
                  ytb_travel_et~travel_uuid as parent_uuid,
                  /dmo/booking~booking_id,
                  /dmo/booking~booking_date,
                  /dmo/booking~customer_id,
                  /dmo/booking~carrier_id,
                  /dmo/booking~connection_id,
                  /dmo/booking~flight_date,
                  /dmo/booking~flight_price,
                  /dmo/booking~currency_code,
                  case /dmo/travel~status when 'P' then 'N'
                                                   else /dmo/travel~status end as booking_status,
                  ytb_travel_et~last_changed_at as local_last_changed_at
    ).


    if sy-subrc eq 0.
      out->write( |Booking:...{ sy-dbcnt } rows inserted.| ).
    endif.

    delete from ytbsppl_et.
    delete from ytbsppl_etd.

    insert ytbsppl_et from (
      select from /dmo/book_suppl    as supp
               join ytb_travel_et  as trvl on trvl~travel_id = supp~travel_id
               join ytb_booking as book on book~parent_uuid = trvl~travel_uuid
                                            and book~booking_id = supp~booking_id

        fields
          " client
          uuid( )                 as booksuppl_uuid,
          trvl~travel_uuid        as root_uuid,
          book~booking_uuid       as parent_uuid,
          supp~booking_supplement_id,
          supp~supplement_id,
          supp~price,
          supp~currency_code,
          trvl~last_changed_at    as local_last_changed_at
    ).

    if sy-subrc eq 0.
      out->write( |Booking Supplements:...{ sy-dbcnt } rows inserted.| ).
    endif.


  ENDMETHOD.
ENDCLASS.
