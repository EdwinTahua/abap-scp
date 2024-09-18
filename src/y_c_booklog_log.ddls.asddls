@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity y_c_booklog_log
  as projection on y_i_booklog_log
{
  key TravelId      as TravelID,
  key BookingId     as BookingID,
      BookingDate,
      CustomerId    as CustomerID,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId     as CarrierID,
      _Carrier.Name as CarrierName,
      ConnectionId  as ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _Travel            : redirected to parent y_c_travel_log,
      _BookingSupplement : redirected to composition child y_c_booksuppl_log,
      _Carrier,
      _Connection

}
