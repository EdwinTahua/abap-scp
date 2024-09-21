@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity yc_libros
  as select from    ytb_libros   as Libros
    left outer join      ytb_category as Categorias on Categorias.bi_categ = Libros.bi_categ
    left outer join yc_clnts_lib as Ventas     on Libros.id_libro = Ventas.IdLibro
    association[0..*] to yc_clientes as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
  key Libros.id_libro        as IdLibro,
      Categorias.bi_categ    as BiCateg,
      Categorias.descripcion as Descripcion,
      Libros.titulo          as Titulo,
      Libros.autor           as Autor,
      Libros.editorial       as Editorial,
      Libros.idioma          as Idioma,
      Libros.paginas         as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio          as Precio,
      Libros.moneda          as Moneda,
      case
      when Ventas.Ventas < 1 then 0
      when Ventas.Ventas = 1 then 1
      when Ventas.Ventas = 2 then 2
      when Ventas.Ventas < 2 then 3
      else 0
      end as Ventas,   
            
      Libros.formato         as Formato,
      Libros.url             as Url,
      _Clientes
}
