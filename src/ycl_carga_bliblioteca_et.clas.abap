CLASS ycl_carga_bliblioteca_et DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_carga_bliblioteca_et IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_acc_cat_omez TYPE TABLE OF ytb_acc_category,
          lt_catego_omez  TYPE TABLE OF ytb_category,
          lt_clients_omez TYPE TABLE OF ytb_clientes,
          lt_cl_lib_omez  TYPE TABLE OF ytb_clnts_lib,
          lt_libros_omez  TYPE TABLE OF ytb_libros.

    lt_acc_cat_omez = VALUE #(
        ( bi_categ = 'A' tipo_acceso = 'R' )
        ( bi_categ = 'B' tipo_acceso = 'A' )
        ( bi_categ = 'C' tipo_acceso = 'W' )
        ( bi_categ = 'D' tipo_acceso = 'R' )
        ( bi_categ = 'E' tipo_acceso = 'R' )
    ).
    DELETE FROM ytb_acc_category.
    INSERT ytb_acc_category FROM TABLE @lt_acc_cat_omez.

    lt_catego_omez = VALUE #(
        ( bi_categ = 'A' descripcion = 'Suspenso' )
        ( bi_categ = 'B' descripcion = 'Romantico' )
        ( bi_categ = 'C' descripcion = 'Comedia' )
        ( bi_categ = 'D' descripcion = 'Horror' )
        ( bi_categ = 'E' descripcion = 'Superacion' )
    ).
    DELETE FROM ytb_category.
    INSERT ytb_category FROM TABLE @lt_catego_omez.

    lt_libros_omez = VALUE #(
        ( id_libro = '1' titulo = 'Cien años de soledad' autor = 'Gabriel Garcia Marquez' formato = 'F' idioma = 'ES' moneda = 'DOP' precio = '1550.00' editorial = '' )
        ( id_libro = '2' titulo = 'El señor de los anillos' autor = 'J. R. R. Tolkien' formato = 'F' idioma = 'EN' moneda = 'USD' precio = '55.00' editorial = '' )
        ( id_libro = '3' titulo = '1984' autor = 'George Orwell' formato = 'F' idioma = 'ES' moneda = 'USD' precio = '40.00' editorial = '' )
        ( id_libro = '4' titulo = 'Un mundo feliz' autor = ' Aldous Huxley' formato = 'F' idioma = 'EN' moneda = 'USD' precio = '60.00' editorial = '' )
        ( id_libro = '5' titulo = 'Orgullo y prejuicio' autor = 'Jane Austen' formato = 'F' idioma = 'ES' moneda = 'DOP' precio = '1350.00' editorial = '' )
    ).
    DELETE FROM ytb_libros.
    INSERT ytb_libros FROM TABLE @lt_libros_omez.

    lt_clients_omez = VALUE #(
        ( id_cliente = '1' nombre = 'Pedro' apellidos = 'Ramirez' email = 'pedro@gmail.com' tipo_acceso = 'R' url = '' )
        ( id_cliente = '2' nombre = 'Antonio' apellidos = 'Sanchez' email = 'antonio@gmail.com' tipo_acceso = 'A' url = '' )
        ( id_cliente = '3' nombre = 'Felipe' apellidos = 'Peralta' email = 'felipe@gmail.com' tipo_acceso = 'W' url = '' )
        ( id_cliente = '4' nombre = 'Jose' apellidos = 'Gomez' email = 'jose@gmail.com' tipo_acceso = 'A' url = '' )
        ( id_cliente = '5' nombre = 'Maria' apellidos = 'Rivas' email = 'maria@gmail.com' tipo_acceso = 'R' url = '' )
        ( id_cliente = '6' nombre = 'Juana' apellidos = 'Rosas' email = 'felipe@gmail.com' tipo_acceso = 'W' url = '' )
        ( id_cliente = '7' nombre = 'Edwin' apellidos = 'Tahua' email = 'jose@gmail.com' tipo_acceso = 'A' url = '' )
        ( id_cliente = '8' nombre = 'Yo' apellidos = 'Yo' email = 'maria@gmail.com' tipo_acceso = 'R' url = '' )
    ).
    DELETE FROM ytb_clientes .
    INSERT ytb_clientes  FROM TABLE @lt_clients_omez.

    lt_cl_lib_omez = VALUE #(
        ( id_cliente = '1' id_libro = '3' )
        ( id_cliente = '2' id_libro = '5' )
        ( id_cliente = '3' id_libro = '2' )
        ( id_cliente = '4' id_libro = '1' )
        ( id_cliente = '5' id_libro = '4' )
        ( id_cliente = '1' id_libro = '1' )
        ( id_cliente = '2' id_libro = '2' )
        ( id_cliente = '3' id_libro = '3' )
    ).
    DELETE FROM ytb_clnts_lib .
    INSERT ytb_clnts_lib  FROM TABLE @lt_cl_lib_omez.

    out->write( 'Test out run' ).

  ENDMETHOD.
ENDCLASS.
