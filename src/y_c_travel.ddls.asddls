@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity y_c_travel
  provider contract transactional_query
  as projection on y_r_travel_et
{
  key TravelUuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.3 //0.1 0.2 0.3 0.4 0.8
      TravelId,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Agency_StdVH',
                                                     element: 'AgencyId'
                                                      },
                                                      useForValidation: true
                                                      }]
      AgencyId,
      _Agency.Name       as AgencyName,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Customer_StdVH',
                                                     element: 'CustomerId'
                                                      },
                                                      useForValidation: true
                                                      }]
      CustomerId,
      //      concat( _Customer.LastName, _Customer.FirstName )  as CustomerName,
      //      concat_with_space( _Customer.LastName, _Customer.FirstName, 1 )  as CustomerName,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name : 'I_CurrencyStdVH',
                                                     element: 'Currency'
                                                      },
                                                      useForValidation: true
                                                      }]      
      CurrencyCode,      
      Description,
      
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name : '/DMO/I_Overall_Status_VH_Text',
                                                     element: 'OverallStatus'
                                                      },
                                                      useForValidation: true
                                                      }]      
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,
      
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      /* Associations */
      _Agency,
      _booking: redirected to composition child y_c_booking,
      _Currency,
      _Customer,
      _OverallStatus
}
