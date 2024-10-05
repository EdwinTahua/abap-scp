@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Ses Excel Data'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
@Metadata.allowExtensions: true
define view entity Yc_SES_EXCEL_DATA as projection on yI_SES_EXCEL_DATA
{
  key end_user,
  key Entrysheet,
  key Ebeln,
  key Ebelp,
      Ext_Number,
      Begdate,
      Enddate,
      @Semantics.quantity.unitOfMeasure: 'Base_Uom'
      Quantity,
      Base_Uom,
      Fin_Entry,
      Error,
      Error_Message,
      /* Associations */
      _ses_file : redirected to parent yC_SES_PARENT
}
