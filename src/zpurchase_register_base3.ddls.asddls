@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register Base 3'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPurchase_Register_BASE3
  as select from    ZPurchase_Register_BASE1  as a
    left outer join C_PurchaseOrderHistoryDEX as b on  b.PurchaseOrder             = a.PurchaseOrder
                                                   and b.PurchaseOrderItem         = a.PurchaseOrderItem
                                                   and b.PurchasingHistoryCategory = '0'
    left outer join I_CnsldtnProductGroupT    as c on  c.ProductGroup = a.MaterialGroup
                                                   and c.Language     = 'E'
{

  key a.PurchaseOrder,
  key a.PurchaseOrderItem,
  key a.PURCHASINGHISTORYDOCUMENT,
  key a.Material,
      a.PurchaseOrderType,
      a.PurchaseOrderItemCategory,
      a.PurchaseOrderDate,
      a.CorrespncExternalReference,
      a.CorrespncInternalReference,
      a.PurchasingOrganization,
      a.PurchaseRequisition,
      a.PurchaseRequisitionItem,
      a.CompanyCode,
      a.Supplier,
      a.CreatedByUser,
      a.PurchasingGroup,
      a.DocumentCurrency,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.PurgReleaseTimeTotalAmount,
      a.PricingDocument, //not add
     
      a.Material_Old_Code,
      a.PurchaseOrderItemText,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      a.OrderQuantity,
      a.MaterialType,
      a.MaterialGroup,
      a.Plant,
      a.PlantName,
      a.BaseUnit,
      a.TaxCode,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.EXT_FRT,
      a.netprice,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.NetAmount,

//      a.PurchasingHistoryDocument,
      a.PURCHASINGHISTORYDOCUMENTYEAR,
      a.PURCHASINGHISTORYDOCUMENTITEM,
      a.PostingDate,
      a.gr_header_text,
      a.BillOfLading                as BillOfLading,
      a.DeliveryDocument,
      a.MaterialDocumentItemText,
      a.StorageLocation,
      a.ManufactureDate,
      a.ShelfLifeExpirationDate,
      a.Batch,
      a.TotalGdsMvtQtyInBaseUnit,
      a.GoodsMovementType,
//      a.IsEffectiveGoodsMovement,
      a.GOODSRECEIPTAMOUNTINCOCODECRCY,
      a.SupplierInvoice,
      a.FiscalYear,
      a.SupplierInvoiceItem,
      a.Invoice_Date,
      a.SupplierInvoiceItemAmount,
      a.ReverseDocument,
      // D.
      a.SupplierInvoiceIDByInvcgParty,
      a.SupplierInvoiceStatus,

      a.PurchaseOrderQuantityUnit,

//      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
//      a.Quantity,
//      @Semantics.amount.currencyCode: 'DocumentCurrency'
//      a.PurOrdAmountInCompanyCodeCrcy,
      a.suplier_invoice_posting_dt,
      a.gr_reference_doc,
      a.org_ref_inv_no,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.cgst,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.sgst,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.igst,
      a.TDS_194Q,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.TDS_194C,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.TDS_194J,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.TDS_194I,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.TDS_194JB,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.EXT_FCGST,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.EXT_FSGST,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.EXT_FIGST,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.CESS,
      a.sup_tax_code,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      a.rate,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.Dom_Freight,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.Dom_Pack_Ford,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.Dom_Insurance,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.Dom_Handling,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.Dom_Load_Unload,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.Dom_Other,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.IMP_AirportAuth,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.IMP_Clearing,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.IMP_Freight,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.IMP_Insurance,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.IMP_Loc_Destina,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.IMP_Loc_Trans,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.IMP_Inspection,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.Basic_Custom_duty,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.Social_welfare_cess,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      a.CGST_value,
      a.IGST_value,
      a.CGST_RATE,
      a.IGST_RATE,
      a.zrate,
//      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
//      a.ZGR_AMT,
      a.FI_DOCUMNET_NO,
      a.FI_DOCUMENT_YEAR,
      a.FI_DOCUMENT_POST_DATE,
      a.TAXITEMREF,
      a.CompanyCodeCurrency,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      a.QtyInPurchaseOrderPriceUnit,
      a.form_name,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      a.net_amount,
      a.frd_amt,
      a.GoodsMovementEntryUnit,
      @Semantics: { quantity : {unitOfMeasure: 'GoodsMovementEntryUnit'} }
      a.QuantityInEntryUnit,
      a.qty_ety_unt,
      a.miro_qty,

      case  when a.frd_amt > 0 and a.qty_ety_unt <> 0 and a.miro_qty > 0 then
          cast( ( cast( a.frd_amt as abap.dec(15,3) ) / cast( a.qty_ety_unt as abap.dec(15,3) ) * cast( a.miro_qty as abap.dec(23,3) )) as abap.dec(23,2))
        else
          cast( a.frd_amt as abap.dec(23,2) ) end as frd_amount,



      a.SupplierName,
      a.CityName,
      a.Region,
      b.PurchasingHistoryDocument   as GRR_Service_enteysheet,
      b.PostingDate                 as GRR_Service_enteysheet_DT,
      b.ReferenceDocumentFiscalYear as GRR_Service_enteysheet_YY,
      c.ProductGroupName,
      a.frg_Supplier,
      a.frg_Supplier_name
}
