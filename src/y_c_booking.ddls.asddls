@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true

define view entity y_c_booking
  as projection on y_r_booking_et
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Customer_StdVH',
                                                     element: 'CustomerId'
                                                      },
                                                      useForValidation: true
                                                      }]
      CustomerId,

      //      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Flight_StdVH',
                                                     element: 'AirlineID'
                                                      },
                                                      additionalBinding: [{ localElement: 'FlightDate',
                                                                            element: 'FlightDate',
                                                                            usage: #RESULT
                                                                              },
                                                                          {
                                                                          localElement: 'ConnectionId',
                                                                            element: 'ConnectionId',
                                                                            usage: #RESULT
                                                                          },
                                                                          {
                                                                          localElement: 'FlightPrice',
                                                                            element: 'Price',
                                                                            usage: #RESULT
                                                                          },

                                                                                                                                                                                                                                {
                                                                          localElement: 'CurrencyCode',
                                                                            element: 'CurrencyCode',
                                                                            usage: #RESULT
                                                                          }
                                                                          ],

                                                      useForValidation: true
                                                      }]
      AirlineID,

      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Flight_StdVH',
                                                     element: 'ConnectionId'
                                                      },
                                                      additionalBinding: [{ localElement: 'FlightDate',
                                                                            element: 'FlightDate',
                                                                            usage: #RESULT
                                                                              },
                                                                          {
                                                                          localElement: 'AirlineID',
                                                                            element: 'AirlineID',
                                                                            usage: #FILTER_AND_RESULT
                                                                          },
                                                                          {
                                                                          localElement: 'FlightPrice',
                                                                            element: 'Price',
                                                                            usage: #RESULT
                                                                          },

                                                                                                                                                                                                                                {
                                                                          localElement: 'CurrencyCode',
                                                                            element: 'CurrencyCode',
                                                                            usage: #RESULT
                                                                          }
                                                                          ],

                                                      useForValidation: true
                                                      }]      
      ConnectionId,

      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Flight_StdVH',
                                                     element: 'FlightDate'
                                                      },
                                                      additionalBinding: [{
                                                                          localElement: 'AirlineID',
                                                                            element: 'AirlineID',
                                                                            usage: #FILTER_AND_RESULT
                                                                          },
                                                                          {
                                                                          localElement: 'FlightPrice',
                                                                            element: 'Price',
                                                                            usage: #RESULT
                                                                          },

                                                                                                                                                                                                                                {
                                                                          localElement: 'CurrencyCode',
                                                                            element: 'CurrencyCode',
                                                                            usage: #RESULT
                                                                          }
                                                                          ],

                                                      useForValidation: true
                                                      }]        
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'

      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Flight_StdVH',
                                                     element: 'Price'
                                                      },
                                                      additionalBinding: [{
                                                                          localElement: 'AirlineID',
                                                                            element: 'AirlineID',
                                                                            usage: #FILTER_AND_RESULT
                                                                          },
                                                                          {
                                                                          localElement: 'ConnectionId',
                                                                            element: 'ConnectionId',
                                                                            usage: #FILTER_AND_RESULT
                                                                          },
                                                                                                                                                                                                                                {
                                                                          localElement: 'CurrencyCode',
                                                                            element: 'CurrencyCode',
                                                                            usage: #FILTER_AND_RESULT
                                                                          }                                                                          
                                                                          ],

                                                      useForValidation: true
                                                      }]         
      FlightPrice,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name : 'I_CurrencyStdVH',
                                                     element: 'Currency'
                                                      },
                                                      useForValidation: true
                                                      }]       
      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,
      /* Associations */
      _booking_supplement: redirected to composition child y_c_book_suppl,
      _Travel: redirected to parent y_c_travel
}
