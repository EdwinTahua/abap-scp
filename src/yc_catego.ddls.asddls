@AbapCatalog.sqlViewName: 'YV_CATEGO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorías'
@Metadata.ignorePropagatedAnnotations: true
define view yc_catego as select from ytb_category
{
    key bi_categ as BiCateg,
    descripcion as Descripcion
}
