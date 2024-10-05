@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity y_r_booking_et
  as select from ytb_booking
  association        to parent y_r_travel_et as _Travel     on  $projection.TravelUuid = _Travel.TravelUuid
  composition [0..*] of y_r_book_suppl_et    as _booking_supplement
  association [1..1] to /DMO/I_Customer      as _Customer   on  $projection.CustomerId = _Customer.CustomerID

  association [1..1] to /DMO/I_Carrier       as _Carrier    on  $projection.AirlineID = _Carrier.AirlineID

  association [1..1] to /DMO/I_Connection    as _Connection on  $projection.AirlineID    = _Connection.AirlineID
                                                            and $projection.ConnectionId = _Connection.ConnectionID

  association [1..1] to /DMO/I_Booking_Status_VH       as _Booking_Status  on  $projection.BookingStatus = _Booking_Status.BookingStatus

{
  key booking_uuid          as BookingUuid,
      parent_uuid           as TravelUuid,

      booking_id            as BookingId,
      booking_date          as BookingDate,
      customer_id           as CustomerId,
      carrier_id            as AirlineID,
      connection_id         as ConnectionId,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,
      //local etag - odata
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Travel,
      _booking_supplement,
      _Carrier,
      _Connection,
      _Customer
}
