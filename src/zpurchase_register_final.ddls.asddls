@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register final'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo: {
  typeName:       'Total Record',
  typeNamePlural: 'Total Records',
  title: {
    value: 'PurchaseOrder'
  }
}
define view entity ZPurchase_Register_final
  as select from ZPurchase_Register_BASE3 as a
{
      @UI.facet: [{ id: 'PurchaseOrder',
                     purpose: #STANDARD,
                     type: #IDENTIFICATION_REFERENCE,
                     label: 'Purchase Register',
                     position: 10
         }]



      @EndUserText.label: 'Purchase Order'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8


      @UI.identification: [{ position: 5, label: 'Purchase Order' } ]
      @UI.selectionField: [{ position: 10 }]
  key PurchaseOrder,
      @UI.lineItem: [{position:6, label: 'Purchase order item'}]
      @EndUserText.label: 'Purchase order item'
  key PurchaseOrderItem,
      @EndUserText.label: 'Invoice No'
      @UI.lineItem: [{position:7,label: 'Invoice No'}]
  key SupplierInvoice,
      @EndUserText.label: 'Invoice Item'
      @UI.lineItem: [{position:8,label: 'Invoice Item'}]
  key SupplierInvoiceItem,
      @EndUserText.label: 'Inv Doc Yr'
      @UI.lineItem: [{position:9, label:'Inv Doc Yr' }]
  key FiscalYear,
      @EndUserText.label: 'GRN No'
      @UI.lineItem: [{position:35, label: 'GRN No'}]
 key  PurchasingHistoryDocument,
  

      @EndUserText.label: 'PO Document Type'
      @UI.lineItem: [{ position: 10, label: 'PO Document Type' }]
      @UI.selectionField: [{ position: 20 }]
      PurchaseOrderType,

      @EndUserText.label: 'PO Item Type'
      @UI.lineItem: [{ position: 11, label: 'PO Item Type' }]
      //      @UI.selectionField: [{ position: 2 }]
      PurchaseOrderItemCategory,

      @EndUserText.label: 'PurchaseRequisition'
      @UI.lineItem: [{ position: 12, label: 'PurchaseRequisition' }]
      PurchaseRequisition,
      @EndUserText.label: 'Purchase Requisition Item'
      @UI.lineItem: [{ position: 13, label: 'Purchase Requisition Item' }]
      PurchaseRequisitionItem,

      @UI.lineItem: [{position:17, label: 'Purchase order date' }]
      @EndUserText.label: 'Purchase order date'
      @UI.selectionField: [{ position: 30 }]
      PurchaseOrderDate,
      @UI.lineItem: [{ position: 18, label: 'YOUR REFERENCE' }]
      CorrespncExternalReference,
      @UI.lineItem: [{ position: 19, label: 'OUR REFERENCE' }]
      CorrespncInternalReference,
      @UI.lineItem: [{position:20, label: 'Purchase Organization' }]
      @EndUserText.label: 'Purchase Organization'
      @UI.selectionField: [{ position: 40 }]
      PurchasingOrganization,
      @UI.lineItem: [{position:21 , label: 'Company Code' }]
      @EndUserText.label: 'Company Code'
      @UI.selectionField: [{ position: 50 }]
      CompanyCode,
      @UI.lineItem: [{position:22}]
      @EndUserText.label: 'Supplier'
      @UI.selectionField: [{ position: 60 }]
      Supplier,
      @UI.lineItem: [{position:23}]
      @EndUserText.label: 'Created By User'
      CreatedByUser,
      @UI.lineItem: [{position:24, label:'Purchase group'  }]
      @EndUserText.label: 'Purchase group'
      PurchasingGroup,

      DocumentCurrency,
      @UI.lineItem: [{ position: 25, label: 'PO Released Value' }]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      PurgReleaseTimeTotalAmount,
      @UI.lineItem: [{position:26}]
      @EndUserText.label: 'Material'
      Material,

      @UI.lineItem: [{position:26.1, label: 'Material Old Code' }]
      @EndUserText.label: 'Material Old Code'
      Material_Old_Code,


      @UI.lineItem: [{position:27, label: 'Material Description'}]
      @EndUserText.label: 'Material Description'
      PurchaseOrderItemText,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @UI.lineItem: [{position:28, label: 'PO Quantity'}]
      @EndUserText.label: 'PO Quantity'
      OrderQuantity,
      @UI.lineItem: [{position:29, label: 'Material Type'}]
      @EndUserText.label: 'Material Type'
      MaterialType,
      @UI.lineItem: [{position:30, label: 'Material Group'}]
      @EndUserText.label: 'Material Group'
      MaterialGroup,
      @UI.lineItem: [{position:31, label: 'Plant'}]
      @EndUserText.label: 'Plant'
      Plant,
      
      @UI.lineItem: [{position:31, label: 'Plant Name'}]
      @EndUserText.label: 'Plant Name'
      PlantName,
      
      
      @UI.lineItem: [{position:32, label: 'Unit of Measurement'}]
      @EndUserText.label: 'Base Unit'
      BaseUnit,
      @UI.lineItem: [{position:33, label: 'PO Tax Code'}]
      TaxCode,
      @UI.lineItem: [{position:34, label: 'PO Item Rate'}]
      @EndUserText.label: 'PO Item Rate'
      netprice,
      @UI.lineItem: [{position:34, label: 'PO Item Net Amount'}]
      @EndUserText.label: 'PO Item NetAmount'
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetAmount,
   
      @EndUserText.label: 'DOC Yr'
      @UI.lineItem: [{position:36, label: 'DOC Yr'}]
      PurchasingHistoryDocumentYear,
      @EndUserText.label: 'GRN Item No'
      @UI.lineItem: [{position:37, label: 'GRN Item No'}]
      PurchasingHistoryDocumentItem,
      @EndUserText.label: 'GRN Date'
      @UI.lineItem: [{position:38, label: 'GRN Date'}]
      PostingDate,
      @EndUserText.label: 'GRN Header Text'
      @UI.lineItem: [{position:39, label: 'GRN Header Text'}]
      gr_header_text,
      @EndUserText.label: 'Bill of Lading'
      @UI.lineItem: [{position:40, label: 'Bill of Lading'}]
      BillOfLading,
      @EndUserText.label: 'Delivery note'
      @UI.lineItem: [{position:40, label: 'Delivery note'}]
      DeliveryDocument,
      @EndUserText.label: 'GRN Item Text'
      @UI.lineItem: [{position:41, label: 'GRN Item Text'}]
      MaterialDocumentItemText,
      @EndUserText.label: 'Storage Location'
      @UI.lineItem: [{position:42, label: 'Storage Location'}]
      StorageLocation,
      @EndUserText.label: 'Manufacturing Date'
      @UI.lineItem: [{position:43, label: 'Manufacturing Date'}]
      ManufactureDate,
      
      @EndUserText.label: 'Expiry Date'
      @UI.lineItem: [{position:43.1, label: 'Expiry Date'}]
      ShelfLifeExpirationDate,
      
      @EndUserText.label: 'Batch'
      @UI.lineItem: [{position:44, label: 'Batch'}]
      Batch,

      @EndUserText.label: 'GRN Quantity'
      @UI.lineItem: [{position:46, label: 'GRN Quantity'}]
      TotalGdsMvtQtyInBaseUnit,

      @EndUserText.label: 'Movemen type'
      @UI.lineItem: [{position:47, label: 'Movemen type'}]
      GoodsMovementType,
//      @EndUserText.label: 'Is Effective Goods Movement'
//      @UI.lineItem: [{position:47, label: 'Is Effective Goods Movement'}]
//      IsEffectiveGoodsMovement,
      @EndUserText.label: 'GRN Amount'
      @UI.lineItem: [{position:47,label: 'GRN Amount'}]
      GOODSRECEIPTAMOUNTINCOCODECRCY,
      @EndUserText.label: 'Invoice Document Date'
      @UI.lineItem: [{position:47, label: 'Invoice Document Date'}]
      Invoice_Date,
      @EndUserText.label: 'Invoice Basic Value'
      @UI.lineItem: [{position:48, label: 'Invoice Basic Value'}]
      SupplierInvoiceItemAmount,
      @EndUserText.label: 'Invoice Ref Doc No'
      @UI.lineItem: [{position:49, label: 'Invoice Ref Doc No'}]
      ReverseDocument,
      @EndUserText.label: 'Reverse Document status'
      @UI.lineItem: [{position:50, label: 'Reverse Document status'}]
      SupplierInvoiceIDByInvcgParty,

      @EndUserText.label: 'Invoice create Status'
      @UI.lineItem: [{position:51, label: 'Invoice create Status'}]
      SupplierInvoiceStatus,





      @EndUserText.label: 'GRR/ServSheet'
      @UI.lineItem: [{position:90, label: 'GRR/ServSheet'}]
      GRR_Service_enteysheet,
      @EndUserText.label: 'FI Documnent No.'
      @UI.lineItem: [{position:100, label: 'FI Documnent No.'}]
      //    @Semantics.amount.currencyCode: 'DocumentCurrency'
      FI_DOCUMNET_NO,
      @EndUserText.label: 'FI Documnent Posting Date'
      @UI.lineItem: [{position:120, label: 'FI Documnent Posting Date'}]
      //    @Semantics.amount.currencyCode: 'DocumentCurrency'
      FI_DOCUMENT_POST_DATE,

      @EndUserText.label: 'Inv Posting Date'
      @UI.lineItem: [{position:140, label: 'Inv Posting Date'}]
      suplier_invoice_posting_dt,

      @EndUserText.label: 'Vendor Name'
      @UI.lineItem: [{position:165, label: 'Vendor Name'}]
      SupplierName,
      @EndUserText.label: 'Vendor City'
      @UI.lineItem: [{position:175, label: 'Vendor City'}]
      CityName,
      @EndUserText.label: 'Vendor Region'
      @UI.lineItem: [{position:185, label: 'Vendor Region'}]
      Region,
      @EndUserText.label: 'Gross Invoice Amount'
      @UI.lineItem: [{position:200, label: 'Gross Invoice Amount'}]
      (coalesce(get_numeric_value(frd_amount ),0)) +
      (coalesce(get_numeric_value(SupplierInvoiceItemAmount ),0)) +
      (coalesce(get_numeric_value(cgst ),0)) +
      (coalesce(get_numeric_value(sgst ),0)) +
      (coalesce(get_numeric_value(igst ),0)) +
      (coalesce(get_numeric_value(CESS),0))                                             as gross_inv_amount,
      @EndUserText.label: 'MIRO Qty.'
      @UI.lineItem: [{position:215,label: 'MIRO Qty.'}]
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      QtyInPurchaseOrderPriceUnit,



      @EndUserText.label: 'Product Group Name'
      @UI.lineItem: [{position:275,label: 'Product Group Name' }]
      ProductGroupName,




      @EndUserText.label: 'FI Documnent year'
      @UI.lineItem: [{position:315, label: 'FI Documnent year'}]
      //    @Semantics.amount.currencyCode: 'DocumentCurrency'
      FI_DOCUMENT_YEAR,



//      @EndUserText.label: 'GRN Qty'
//      @UI.lineItem: [{position:355, label: 'GRN Qty'}]
//      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
//      @UI.hidden: true
//      Quantity,

//      @EndUserText.label: 'GRN Amount'
//      @UI.lineItem: [{position:365, label: 'GRN Amount'}]
//      @Semantics.amount.currencyCode: 'DocumentCurrency'
//      case when PurchaseOrderType = 'ZINC' then
//       cast( ZGR_AMT as abap.dec( 15, 3 ))
//      else
//       cast( PurOrdAmountInCompanyCodeCrcy as abap.dec( 15, 3 ))
//       end                                                                              as GR_AMOUNT,


      @EndUserText.label: 'GRN Reference No'
      @UI.lineItem: [{position:375, label: 'GRN Reference No'}]
      gr_reference_doc,


      @EndUserText.label: 'GRR/ServSheet Dt'
      @UI.lineItem: [{position:405, label: 'GRR/ServSheet Dt'}]
      GRR_Service_enteysheet_DT,
      @EndUserText.label: 'GRR/ServSheet YY'
      @UI.lineItem: [{position:410, label: 'GRR/ServSheet YY'}]
      GRR_Service_enteysheet_YY,

      @EndUserText.label: 'Tax code'
      @UI.lineItem: [{position:420, label: 'Tax code'}]
      sup_tax_code,
      @UI.lineItem: [{position:425, label: 'PO Rate'}]
      //    @EndUserText.label: 'Net Price'
      //   @Semantics.amount.currencyCode: 'DocumentCurrency'
      //   @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @EndUserText.label: 'PO Rate'
      @UI.hidden: true
      //    rate,
      case when PurchaseOrderType = 'ZINC' then
       cast(zrate as abap.dec( 23, 3 ))
      else
       cast(rate as abap.dec( 23, 3 ))
       end                                                                              as rate,



      @EndUserText.label: 'Freight Amount'
      @UI.lineItem: [{position:460, label: 'Freight Amount'}]
      frd_amt,

      @EndUserText.label: 'Extra Freight Amount'
      @UI.lineItem: [{position:461, label: 'Extra Freight Amount'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      EXT_FRT,

      @EndUserText.label: 'Net Amount'
      @UI.lineItem: [{position:180, label: 'Net Amount'}]
      cast((coalesce(get_numeric_value(frd_amount ),0)) +
      (coalesce(get_numeric_value(SupplierInvoiceItemAmount ),0)) as abap.dec( 17, 2 )) as net_amount,

      @EndUserText.label: 'Form Name.'
      @UI.lineItem: [{position:475, label: 'Form Name.'}]
      @UI.hidden: true
      form_name,

      @EndUserText.label: 'CGST Rate'
      @UI.lineItem: [{position:480,label: 'CGST Rate'}]
      CGST_RATE,
      @EndUserText.label: 'CGST Value'
      @UI.lineItem: [{position:481, label: 'CGST Value'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      cgst                                                                              as CGST_VALUE,

      @EndUserText.label: 'SGST Rate'
      @UI.lineItem: [{position:482, label: 'SGST Rate'}]
      //    @Semantics.amount.currencyCode: 'DocumentCurrency'
      CGST_RATE                                                                         as SGST_RATE,
      @EndUserText.label: 'SGST Value'
      @UI.lineItem: [{position:482.1, label: 'SGST Value'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      sgst                                                                              as SGST_VALUE,

      @EndUserText.label: 'IGST Rate'
      @UI.lineItem: [{position:482.2,label: 'IGST Rate'}]
      IGST_RATE,
      @EndUserText.label: 'IGST Value'
      @UI.lineItem: [{position:482.3,label: 'IGST Value'}]
      //    @Semantics.amount.currencyCode: 'DocumentCurrency'
      //    round( cast(IGST_value as abap.dec( 12, 3 )),2) as ISGT_VALUE,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      igst                                                                              as ISGT_VALUE,


      @EndUserText.label: 'Fright CGST Value'
      @UI.lineItem: [{position:482.4, label: 'Fright CGST Value'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      EXT_FCGST,

      @EndUserText.label: 'Fright SGST Value'
      @UI.lineItem: [{position:482.5, label: 'Fright SGST Value'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      EXT_FSGST,

      @EndUserText.label: 'Fright IGST Value'
      @UI.lineItem: [{position:482.6, label: 'Fright IGST Value'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      EXT_FIGST,


//      @EndUserText.label: 'CESS Value'
//      @UI.lineItem: [{position:550, label: 'CESS Value'}]
//      //    @Semantics.amount.currencyCode: 'DocumentCurrency'
//      //    round( cast(IGST_value as abap.dec( 12, 3 )),2) as ISGT_VALUE,
//      @Semantics.amount.currencyCode: 'DocumentCurrency'
//      CESS                                                                              as CESS_VALUE,




      @EndUserText.label: 'TDS-194Q'
      @UI.lineItem: [{position:482.7, label: 'TDS-194Q'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      TDS_194Q,
      @EndUserText.label: 'TDS_194C'
      @UI.lineItem: [{position:482.8, label: 'TDS_194C'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      TDS_194C,
      @EndUserText.label: ' TDS_194J'
      @UI.lineItem: [{position:482.9, label: ' TDS_194J'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      TDS_194J,
      @EndUserText.label: ' TDS_194I'
      @UI.lineItem: [{position:483, label: ' TDS_194I'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      TDS_194I,
      @EndUserText.label: 'TDS_194JB'
      @UI.lineItem: [{position:483.1, label: 'TDS_194JB'}]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      TDS_194JB,


      //NetPriceAmount,

      @UI.lineItem: [{position:575, label: 'Freight Credit Vendor'}]
      @EndUserText.label: 'Freight Credit Vendor'
      frg_Supplier,
      @UI.lineItem: [{position:700, label: 'Freight Credit Vendor Name'}]
      @EndUserText.label: 'Freight Credit Vendor Name'
      frg_Supplier_name

}
