@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface booking supll'
//@Metadata.ignorePropagatedAnnotations: true
define view entity y_i_book_suppl as projection on y_r_book_suppl_et
{
    key BooksupplUuid,
    TravelUuid,
    BookingUUID,
    BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LocalLastChangedAt,
    /* Associations */
    _booking: redirected to parent y_i_booking,
    _SupplementText,
    _travel: redirected to y_i_travel
}
