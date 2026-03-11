@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PURCHASE REG TX CAL'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPURCHASE_REG_TAX
  as select from    ZPURCHASE_REGISTER_BASE   as a
  //
    left outer join I_OperationalAcctgDocItem as b      on  a.org_ref_inv_no               = b.OriginalReferenceDocument
                                                        and a.SupplierInvoiceItem          = b.TaxItemAcctgDocItemRef
                                                        and b.TransactionTypeDetermination = 'WRX'

    left outer join I_OperationalAcctgDocItem as c      on  c.OriginalReferenceDocument    = a.org_ref_inv_no
                                                        and c.PurchasingDocument           = a.PurchaseOrder
                                                        and c.PurchasingDocumentItem       = a.PurchaseOrderItem
                                                        and c.TransactionTypeDetermination = 'FR1'

    left outer join I_OperationalAcctgDocItem as d      on  d.OriginalReferenceDocument    = a.org_ref_inv_no
                                                        and d.PurchasingDocument           = a.PurchaseOrder
                                                        and d.PurchasingDocumentItem       = a.PurchaseOrderItem
    //                                               and d.TaxItemAcctgDocItemRef       = a.SupplierInvoiceItem
                                                        and d.TransactionTypeDetermination = 'BSX'

    left outer join I_OperationalAcctgDocItem as E      on  E.OriginalReferenceDocument    = a.org_ref_inv_no
                                                        and E.TaxItemAcctgDocItemRef       = a.SupplierInvoiceItem
                                                        and E.PurchasingDocument           = ' '
                                                        and E.TransactionTypeDetermination = 'JIC'

    left outer join I_OperationalAcctgDocItem as F      on  F.OriginalReferenceDocument    = a.org_ref_inv_no
                                                        and F.TaxItemAcctgDocItemRef       = a.SupplierInvoiceItem
                                                        and F.TransactionTypeDetermination = 'JIS'

    left outer join I_OperationalAcctgDocItem as j      on  j.OriginalReferenceDocument    = a.org_ref_inv_no
                                                        and j.TaxItemAcctgDocItemRef       = a.SupplierInvoiceItem
                                                        and j.TransactionTypeDetermination = 'JII'

    left outer join I_OperationalAcctgDocItem as E_CGST on  E_CGST.OriginalReferenceDocument    = d.OriginalReferenceDocument
                                                        and E_CGST.PurchasingDocument           = ' '
                                                        and E_CGST.TaxItemAcctgDocItemRef       = d.TaxItemAcctgDocItemRef
                                                        and E_CGST.TransactionTypeDetermination = 'JIC'

    left outer join I_OperationalAcctgDocItem as E_SGST on  E_SGST.OriginalReferenceDocument    = d.OriginalReferenceDocument
                                                        and E_CGST.PurchasingDocument           = ' '
                                                        and E_SGST.TaxItemAcctgDocItemRef       = d.TaxItemAcctgDocItemRef
                                                        and E_SGST.TransactionTypeDetermination = 'JIS'

    left outer join I_OperationalAcctgDocItem as E_IGST on  E_IGST.OriginalReferenceDocument    = d.OriginalReferenceDocument
                                                        and E_CGST.PurchasingDocument           = ' '
                                                        and E_IGST.TaxItemAcctgDocItemRef       = d.TaxItemAcctgDocItemRef
                                                        and E_IGST.TransactionTypeDetermination = 'JII'

    left outer join ZWITHOLDING_TAX           as Wt     on Wt.OriginalReferenceDocument = a.org_ref_inv_no
                                                        and Wt.LINE_NO = a.SupplierInvoiceItem


{
  key a.org_ref_inv_no,
      a.SupplierInvoiceItem,
      b.TaxCode,
      b.AccountingDocument,
      //      b.AccountingDocumentCategory,
      b.FiscalYear,

      //  cast(b.AmountInTransactionCurrency as abap.dec(15,2)) as AmountInTransactionCurrency ,
      b.TaxItemAcctgDocItemRef,
      b.OriginalReferenceDocument,
      b.PurchasingDocument,
      //  a.PurchaseOrderItem,
      b.Reference3IDByBusinessPartner,
      //      case
      //      when  b.TransactionTypeDetermination = 'WRX'
      //      then
      cast(b.AmountInTransactionCurrency as abap.dec(15,2))      as NET_AMT,

      //      case
      //      when  c.TransactionTypeDetermination = 'FR1'
      //      then
      cast(c.AmountInTransactionCurrency as abap.dec(15,2))      as FRT_AMT,

      //      case
      //      when  d.TransactionTypeDetermination = 'BSX'
      //      then
      cast(d.AmountInTransactionCurrency as abap.dec(15,2))      as EXT_FRT_AMT,

      //      case
      //      when  E.TransactionTypeDetermination = 'JIC'
      //      then
      cast(E.AmountInTransactionCurrency as abap.dec(15,2))      as CGST,

      //      case
      //      when  F.TransactionTypeDetermination = 'JIS'
      //      then
      cast(F.AmountInTransactionCurrency as abap.dec(15,2))      as SGST,

      //      case
      //      when  F.TransactionTypeDetermination = 'JII'
      //      then
      cast(j.AmountInTransactionCurrency as abap.dec(15,2))      as IGST,


      //      case
      //      when  E_CGST.TransactionTypeDetermination = 'JIC'
      //      then
      cast(E_CGST.AmountInTransactionCurrency as abap.dec(15,2)) as EXT_FCGST,

      //      case
      //      when  E_SGST.TransactionTypeDetermination = 'JIS'
      //      then
      cast(E_SGST.AmountInTransactionCurrency as abap.dec(15,2)) as EXT_FSGST,

      //      case
      //      when  E_IGST.TransactionTypeDetermination = 'JII' 
      cast(E_IGST.AmountInTransactionCurrency as abap.dec(15,2)) as EXT_FIGST,



      min( Wt.TDS_194Q )                                         as TDS_194Q,
      min( Wt.TDS_194C )                                         as TDS_194C,
      min( Wt.TDS_194J )                                         as TDS_194J,
      min( Wt.TDS_194I )                                         as TDS_194I,
      min( Wt.TDS_194JB )                                        as TDS_194JB

}
group by
  a.org_ref_inv_no,
  a.SupplierInvoiceItem,
  b.TaxCode,
  b.AccountingDocument,
  b.FiscalYear,
  b.TaxItemAcctgDocItemRef,
  b.OriginalReferenceDocument,
  b.PurchasingDocument,
  //  b.TransactionTypeDetermination,
  b.AmountInTransactionCurrency,
  E_IGST.AmountInTransactionCurrency,
  E_CGST.AmountInTransactionCurrency,
  E_SGST.AmountInTransactionCurrency,
  c.AmountInTransactionCurrency,
  E.AmountInTransactionCurrency,
  d.AmountInTransactionCurrency,
  F.AmountInTransactionCurrency,
  j.AmountInTransactionCurrency,
  b.Reference3IDByBusinessPartner
