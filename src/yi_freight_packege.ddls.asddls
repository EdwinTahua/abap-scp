@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Freight Package'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity yi_freight_packege as select from ytb_freight_pack
//association to parent yi_freightorder as _FreightOrder on $projection.FrightorderNo = _FreightOrder.FrightorderNo
{
    key frightorderno as FrightorderNo,
    key packageno as PackageNo,
    packagedetails as PackageDetails,
    material as Material,
    @Semantics.quantity.unitOfMeasure: 'UOM'
    materialqty as Materialqty,
    uom as UOM,
    @Semantics.user.createdBy: true
    createdby as CreatedBy,
    @Semantics.user.lastChangedBy: true
    changedby as ChangedBy,
    @Semantics.systemDateTime.createdAt: true
    createdat as CreatedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    changedat as ChangedAt
//    _FreightOrder
}
