@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for File'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity yC_SES_PARENT provider contract transactional_query
  as projection on YI_SES_PARENT
{
  key end_user,
      @EndUserText.label: 'Processing Status'
      FileStatus as status,
      Attachment,
      MimeType,
      Filename,
      Local_Created_By,
      Local_Created_At,
      Local_Last_Changed_By,
      @EndUserText.label: 'Last Action On'
      Local_Last_Changed_At,
      Last_Changed_At,
      CriticalityStatus,
      HideExcel,
      
      /* Associations */
      _ses_excel : redirected to composition child Yc_SES_EXCEL_DATA
}
