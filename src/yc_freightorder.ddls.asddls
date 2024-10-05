@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Freight Order Package'
@Metadata.allowExtensions: true
define root view entity yc_freightorder
  as select from yi_freightorder as _FreightOrder
  composition [0..*] of yc_freight_package as _FreightPackege
{
  key _FreightOrder.FrightorderNo,
  @Semantics.amount.currencyCode: 'Currency'
      _FreightOrder.TotalAmount,
      _FreightOrder.Currency,
      _FreightOrder.PriorityDelivery,
      _FreightOrder.CreatedBy,
      _FreightOrder.ChangedBy,
      _FreightOrder.CreatedAt,
      _FreightOrder.ChangedAt,
      _FreightPackege

}
