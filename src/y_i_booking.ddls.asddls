@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity y_i_booking as projection on y_r_booking_et
{
    key BookingUuid,
    TravelUuid,
    BookingId,
    BookingDate,
    CustomerId,
    AirlineID,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LocalLastChangedAt,
    /* Associations */
    _booking_supplement,
    _Travel: redirected to parent y_i_travel
}
