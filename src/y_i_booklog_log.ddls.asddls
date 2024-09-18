@AbapCatalog.sqlViewName: 'YVBOOK_LOG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface book'
@Metadata.ignorePropagatedAnnotations: true
define view y_i_booklog_log
  as select from ybooking_log as Booking
  composition [0..*] of Y_I_BOOKSUPPL_LOG as _BookingSupplement
  association to parent y_i_travel_log as _Travel on $projection.TravelId = _Travel.TravelId

association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association [1..1] to /DMO/I_Carrier as _Carrier on $projection.CarrierId = _Carrier.AirlineID
association [1..1] to /DMO/I_Connection as _Connection on $projection.ConnectionId = _Connection.ConnectionID
  
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      _Travel,
      _BookingSupplement,
      _Carrier,
      _Connection,
      _Customer
}
