@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Freight Order Package'
@Metadata.allowExtensions: true
define view entity yc_freight_package as select from yi_freight_packege
association to parent yc_freightorder as _FreightOrder on $projection.FrightorderNo = _FreightOrder.FrightorderNo

{
key yi_freight_packege.FrightorderNo,
key yi_freight_packege.PackageNo,
yi_freight_packege.PackageDetails,
yi_freight_packege.Material,
yi_freight_packege.Materialqty,
yi_freight_packege.UOM,
yi_freight_packege.CreatedBy,
yi_freight_packege.ChangedBy,
yi_freight_packege.CreatedAt,
yi_freight_packege.ChangedAt,
/* Associations */
_FreightOrder
}
