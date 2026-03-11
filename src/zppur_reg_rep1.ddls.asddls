@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PURCHASE REGISTER REPORT'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPPUR_REG_REP1 
as select from I_PurchaseOrderItemAPI01  as a
left outer join I_PurchaseOrderAPI01 as b on a.PurchaseOrder = b.PurchaseOrder
left outer join I_PurchaseOrderHistoryAPI01 as c on a.PurchaseOrder = c.PurchaseOrder
                                                 and a.PurchaseOrderItem = c.PurchaseOrderItem and c.PurchasingHistoryCategory = 'E'
left outer join C_SupplierInvoiceItemDEX  as D on c.PurchaseOrder = D.PurchaseOrder
                                               and c.PurchaseOrderItem = D.PurchaseOrderItem and 
                                                  c.ReferenceDocument = D.PrmtHbReferenceDocument and
                                                  c.ReferenceDocumentItem = D.PrmtHbReferenceDocumentItem and
                                                  c.ReferenceDocumentFiscalYear = D.PrmtHbReferenceDocumentFsclYr 
                                                  
left outer join I_MaterialDocumentItem_2 as g on g.MaterialDocument     =  c.ReferenceDocument and
                                                 g.MaterialDocumentItem = c.ReferenceDocumentItem and 
                                                 g.Plant                = c.Plant and 
                                                 g.MaterialDocumentYear = c.PurchasingHistoryDocumentYear
left outer join I_MaterialDocumentHeader_2 as E on c.PurchasingHistoryDocument = E.MaterialDocument
                                                and c.PurchasingHistoryDocumentYear = E.MaterialDocumentYear  
                                               
left outer join I_GoodsMovementCube as H on H.MaterialDocument = g.MaterialDocument and
                                            H.MaterialDocumentItem = g.MaterialDocumentItem
                                            
//left outer join I_OPERATIONALACCTGDOCITEM AS K                                           
left outer join I_Supplier as f on f.Supplier = b.Supplier                                                                                               
                                                  
                                               
{
 key a.PurchaseOrder,
 key a.PurchaseOrderItem,
  b.PurchaseOrderType,
  b.PurchaseOrderDate,
  b.CorrespncExternalReference,
  b.CorrespncInternalReference,
  b.PurchasingOrganization,
  b.CompanyCode,
  b.Supplier,
  b.CreatedByUser,
  b.PurchasingGroup,
  b.DocumentCurrency,
   @Semantics.amount.currencyCode: 'DocumentCurrency'
  b.PurgReleaseTimeTotalAmount,
//  b.PricingDocument,        //not add
  a.Material,
  a.PurchaseOrderItemText,
  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  a.OrderQuantity,
  a.MaterialType,
  a.MaterialGroup,
  a.Plant,
  a.BaseUnit,
  a.TaxCode,
  @Semantics.amount.currencyCode: 'DocumentCurrency'
  a.NetAmount,
  c.PurchasingHistoryDocument,
  c.PurchasingHistoryDocumentYear,
  c.PurchasingHistoryDocumentItem,
  c.PostingDate,
  E.MaterialDocumentHeaderText as gr_header_text,
  E.BillOfLading as BillOfLading,
  E.DeliveryDocument,
  g.MaterialDocumentItemText,
  g.StorageLocation,
  g.ManufactureDate,
  g.Batch,
  cast(H.TotalGdsMvtQtyInBaseUnit as abap.dec(15,2)) as TotalGdsMvtQtyInBaseUnit,
  H.GoodsMovementType,
  H.IsEffectiveGoodsMovement,
 cast( H.GoodsReceiptAmountInCoCodeCrcy as abap.dec(15,2)) as GOODSRECEIPTAMOUNTINCOCODECRCY,
 D.SupplierInvoice,
 D.FiscalYear,
 D.SupplierInvoiceItem,
 D.PostingDate as Invoice_Date,
 cast(D.SupplierInvoiceItemAmount as abap.dec(15,2)) as SupplierInvoiceItemAmount,
 D.ReverseDocument,
// D.
 D.SupplierInvoiceIDByInvcgParty,
 D.SupplierInvoiceStatus,
 
 
  
//  c.GoodsMovementType,
  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  c.Quantity,
  @Semantics.amount.currencyCode: 'DocumentCurrency'
  c.PurOrdAmountInCompanyCodeCrcy,


  a.PurchaseOrderQuantityUnit,
  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  cast( a.NetPriceAmount as abap.quan( 15, 3 )) as netprice,
  //a.PurchaseOrderQuantityUnit,
  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  cast( a.NetPriceQuantity  as abap.quan( 15, 3 )) as netqty,
  @Semantics.amount.currencyCode: 'DocumentCurrency'
  a.GrossAmount,
  case when a.GrossAmount >0 then
//      a.GrossAmount / a.OrderQuantity
      cast( ((get_numeric_value(a.GrossAmount) / a.OrderQuantity )) as abap.dec( 15, 3 ) )
      else
      cast( a.GrossAmount as abap.dec( 15, 3 )) 
      end  as zrate,
      
   
 
  
  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  a.NetPriceQuantity,


  
  
  
  //--------------------------------------------------------------------------
//  concat(concat(D.PrmtHbReferenceDocumentFsclYr,D.PrmtHbReferenceDocument),D.PrmtHbReferenceDocumentItem) as REFERENCE3IDBYBUSINESSPARTNER,
  f.SupplierName,
  f.CityName,
  f.Region
  
  
}
