@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Freight Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity yi_freightorder as select from ytb_freightorder
//composition [0..*] of yi_freight_packege as _FreightPackege
{
    key frightorderno as FrightorderNo,
    @Semantics.amount.currencyCode: 'Currency'
    totalamount as TotalAmount,
    currency as Currency,
    prioritydelivery as PriorityDelivery,
    @Semantics.user.createdBy: true
    createdby as CreatedBy,
    @Semantics.user.lastChangedBy: true
    changedby as ChangedBy,
    @Semantics.systemDateTime.createdAt: true
    createdat as CreatedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    changedat as ChangedAt
//    _FreightPackege    
}
