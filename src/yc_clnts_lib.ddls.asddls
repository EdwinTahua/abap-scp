@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity yc_clnts_lib as select from ytb_clnts_lib
{
    key id_libro as IdLibro , 
    count( distinct id_cliente ) as Ventas
    
}
group by id_libro;
