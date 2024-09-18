@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption - Travel Approval'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Y_C_ATRAVEL_LOG
  as projection on y_i_travel_log
  //composition of target_data_source_name as _association_name
{

  key TravelId           as TravelID,
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId           as AgencyID,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId         as CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Semantics.currencyCode:true
      CurrencyCode,
      Description,
      OverallStatus as TravelStatus,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to composition child y_c_abooklog_log,
      _Customer
}
