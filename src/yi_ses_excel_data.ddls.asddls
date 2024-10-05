@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SES_excel_data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity yI_SES_EXCEL_DATA as select from yses_db
  association to parent YI_SES_PARENT as _ses_file on $projection.end_user = _ses_file.end_user
{
  key end_user              as end_user,
  key yses_db.entrysheet   as Entrysheet,
  key yses_db.ebeln         as Ebeln,
  key yses_db.ebelp         as Ebelp,
      yses_db.ext_number    as Ext_Number,
      yses_db.begdate       as Begdate,
      yses_db.enddate       as Enddate,
      @Semantics.quantity.unitOfMeasure: 'Base_Uom'
      yses_db.quantity      as Quantity,
      yses_db.base_uom      as Base_Uom,
      yses_db.fin_entry     as Fin_Entry,
      yses_db.error         as Error,
      yses_db.error_message as Error_Message,

      _ses_file
}
