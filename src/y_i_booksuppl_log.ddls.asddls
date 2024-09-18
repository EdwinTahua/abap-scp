@AbapCatalog.sqlViewName: 'YV_BOOK_LOG02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Interfaces - Booking Supplement'
define view Y_I_BOOKSUPPL_LOG
  as select from ybooksuppl_log as BookingSupplement
  association        to parent y_i_booklog_log as _Booking        on  $projection.TravelId  = _Booking.TravelId
                                                                  and $projection.BookingId = _Booking.BookingId

  association [1..1] to y_i_travel_log         as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement      as _Product        on  $projection.SupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText  as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID

{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'currency'
      price                 as Price,
      @Semantics.currencyCode: true
      currency_code         as Currency,
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
