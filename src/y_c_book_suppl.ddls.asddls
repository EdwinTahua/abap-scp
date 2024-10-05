@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supl'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity y_c_book_suppl 
as projection on y_r_book_suppl_et
{
    key BooksupplUuid,
    TravelUuid,
    BookingUUID,
    @Search.defaultSearchElement: true
    BookingSupplementId,
    
//      @ObjectModel.text.element: [ 'SupplementDescription' ]
//      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Supplement_StdVH',
//                                                     element: 'SupplementId'
//                                                      },
//                                                      additionalBinding: [{
//                                                                          localElement: 'Price',
//                                                                            element: 'Price',
//                                                                            usage: #FILTER_AND_RESULT
//                                                                          },
//                                                                          {
//                                                                          localElement: 'ConnectionId',
//                                                                            element: 'ConnectionId',
//                                                                            usage: #FILTER_AND_RESULT
//                                                                          },
//                                                                                                                                                                                                                                {
//                                                                          localElement: 'CurrencyCode',
//                                                                            element: 'CurrencyCode',
//                                                                            usage: #FILTER_AND_RESULT
//                                                                          }                                                                          
//                                                                          ],
//
//                                                      useForValidation: true
//                                                      }]    
    SupplementId,
//    _SupplementText.Description as SuppDescription : localized,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LocalLastChangedAt,
    /* Associations */
    _booking: redirected to parent y_c_booking,
    _SupplementText,
    _travel: redirected to y_c_travel,
    _Product

}
