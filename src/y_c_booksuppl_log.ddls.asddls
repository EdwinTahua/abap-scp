@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - bokking supplement'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity y_c_booksuppl_log
  as projection on Y_I_BOOKSUPPL_LOG
{
  key TravelId                    as TravelID,
  key BookingId                   as BookingID,
  key BookingSupplementId         as BookingSupplementID,
      SupplementId                as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Semantics.currencyCode: true
      Currency                    as CurrencyCode,
      /* Associations */
      _Travel  : redirected to y_c_travel_log,
      _Booking : redirected to parent y_c_booklog_log,
      _Product,
      _SupplementText

}
