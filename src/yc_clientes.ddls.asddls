@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity yc_clientes
  as select from ytb_clientes  as Clientes
    inner join   ytb_clnts_lib as ClientesLibros on ClientesLibros.id_cliente = Clientes.id_cliente
    association [1..*] to yc_clnts_lib as _Clnt_lib on $projection.IdLibro = _Clnt_lib.IdLibro
{
  key ClientesLibros.id_cliente as IdCliente,
  key Clientes.tipo_acceso      as TipoAcceso,
  key ClientesLibros.id_libro   as IdLibro,
//      Clientes.nombre           as Nombre,
//      Clientes.apellidos        as Apellidos,
      concat_with_space(Clientes.nombre, Clientes.apellidos, 1) as NombreCompleto,
      Clientes.email            as Email,
      Clientes.url              as Url,
      _Clnt_lib
}
