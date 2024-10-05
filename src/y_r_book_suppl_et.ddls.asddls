@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supl'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity y_r_book_suppl_et
  as select from ytbsppl_et
  association        to parent y_r_booking_et as _booking        on $projection.BooksupplUuid = _booking.BookingUuid
  association [1..*] to y_r_travel_et         as _travel         on $projection.TravelUuid = _travel.TravelUuid

  association [1..1] to /DMO/I_Supplement     as _Product        on $projection.SupplementId = _Product.SupplementID

  association [1..1] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID
{
  key booksuppl_uuid        as BooksupplUuid,
      root_uuid             as TravelUuid,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      //eTag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _booking,
      _Product,
      _SupplementText,
      _travel
}
