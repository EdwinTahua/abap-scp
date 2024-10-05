@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity y_i_travel 
provider contract transactional_interface

as projection on y_r_travel_et

{
    key TravelUuid,
    TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _Agency,
    _booking: redirected to composition child y_i_booking,
    _Currency,
    _Customer,
    _OverallStatus
}
