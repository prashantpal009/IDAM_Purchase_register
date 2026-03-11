@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register Base'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPURCHASE_REGISTER_BASE
  as select from    I_PurchaseOrderItemAPI01   as a
    left outer join I_PurchaseOrderAPI01       as b on a.PurchaseOrder = b.PurchaseOrder
  //    left outer join I_PurchaseOrderHistoryAPI01 as c on  a.PurchaseOrder             = c.PurchaseOrder
  //                                                     and a.PurchaseOrderItem         = c.PurchaseOrderItem
  //                                                     and c.PurchasingHistoryCategory = 'E'

  //c.PurchasingHistoryDocumentItem = D.PrmtHbReferenceDocumentItem
  //and c.PurchasingHistoryDocumentYear = D.PrmtHbReferenceDocumentFsclYr


    left outer join I_GoodsMovementCube        as H on  H.PurchaseOrder              = a.PurchaseOrder
                                                    and H.PurchaseOrderItem          = a.PurchaseOrderItem
    //                                                         H.MaterialDocument         =  g.MaterialDocument
    //                                                     and H.MaterialDocumentItem     =  g.MaterialDocumentItem
                                                    and H.IsEffectiveGoodsMovement   = 'X'
    //                                                     and H.GoodsMovementIsCancelled <> 'X'
                                                    and H.MaterialDocumentRecordType = 'MDOC'
                                                    and ( H.InventoryStockType       = '01'
                                                         or H.InventoryStockType     = '02' 
                                                          or H.InventoryStockType     = ' ')


    left outer join I_MaterialDocumentItem_2   as g on  g.MaterialDocument     = H.MaterialDocument
                                                    and g.MaterialDocumentItem = H.MaterialDocumentItem
                                                    and g.Plant                = H.Plant
                                                    and g.MaterialDocumentYear = H.MaterialDocumentYear

    left outer join I_MaterialDocumentHeader_2 as E on  H.MaterialDocument     = E.MaterialDocument
                                                    and H.MaterialDocumentYear = E.MaterialDocumentYear


    left outer join C_SupplierInvoiceItemDEX   as D on  H.PurchaseOrder        = D.PurchaseOrder
                                                    and H.PurchaseOrderItem    = D.PurchaseOrderItem
                                                    and H.MaterialDocument     = D.PrmtHbReferenceDocument
                                                    and H.MaterialDocumentItem = D.PrmtHbReferenceDocumentItem
                                                    and H.MaterialDocumentYear = D.PrmtHbReferenceDocumentFsclYr
  //    left outer join C_SupplierInvoiceItemDEX   as DE on  D.SupplierInvoice     = DE.SupplierInvoice
  //                                                     and D.SupplierInvoiceItem = DE.SupplierInvoiceItem


    left outer join I_Product                  as j on j.Product = g.Material

    left outer join I_Supplier                 as f on f.Supplier = b.Supplier
    left outer join I_Plant                    as P on P.Plant = a.Plant


{
  key  a.PurchaseOrder,
  key  a.PurchaseOrderItem,
  key  a.Material,
  key  H.MaterialDocument                                                                                      as PURCHASINGHISTORYDOCUMENT,
       b.PurchaseOrderType,

       case
         when a.PurchaseOrderItemCategory = '7'
           then 'Stock Transfer'
         when a.PurchaseOrderItemCategory = '0'
           then 'Standard'
         when a.PurchaseOrderItemCategory = '3'
           then 'Subcontracting'
           when a.PurchaseOrderItemCategory = '5'
           then 'Third Party'

        end                                                                                                    as PurchaseOrderItemCategory,

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
       b.PricingDocument, //not add

       j.ProductOldID                                                                                          as Material_Old_Code,
       a.PurchaseOrderItemText,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       a.OrderQuantity,
       a.MaterialType,
       a.MaterialGroup,
       a.Plant,
       P.PlantName,
       a.BaseUnit,
       a.TaxCode,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       a.NetAmount,
       a.PurchaseRequisition,
       a.PurchaseRequisitionItem,

       H.MaterialDocumentYear                                                                                  as PURCHASINGHISTORYDOCUMENTYEAR,
       H.MaterialDocumentItem                                                                                  as PURCHASINGHISTORYDOCUMENTITEM,
       H.PostingDate,
       E.MaterialDocumentHeaderText                                                                            as gr_header_text,
       E.BillOfLading                                                                                          as BillOfLading,
       E.DeliveryDocument,
       g.MaterialDocumentItemText,
       g.StorageLocation,
       g.ManufactureDate,
       g.ShelfLifeExpirationDate,
       g.Batch,
       case
        when a.PurchaseOrderItemCategory = '5'
        then coalesce(cast( H.MatlCnsmpnQtyInMatlBaseUnit as abap.dec(15,2) ), cast( 0 as abap.dec(15,2) ) )
       else
         coalesce(cast( H.TotalGdsMvtQtyInBaseUnit as abap.dec(15,2) ), cast( 0 as abap.dec(15,2) ))
          end                                                                                                  as TotalGdsMvtQtyInBaseUnit,

       H.GoodsMovementType,
       case
       when a.PurchaseOrderItemCategory = '5'  or a.PurchaseOrderItemCategory = '7'
       then coalesce(cast( H.GoodsMvtCnsmpnAmtInCCCrcy as abap.dec(15,2)) , cast( 0 as abap.dec(15,2) ) )
       else
       coalesce(cast( H.GoodsReceiptAmountInCoCodeCrcy  as abap.dec(15,2) ), cast( 0 as abap.dec(15,2) ))
         end                                                                                                   as GOODSRECEIPTAMOUNTINCOCODECRCY,

       D.SupplierInvoice,
       D.FiscalYear,
       D.SupplierInvoiceItem,
       D.DocumentDate                                                                                          as Invoice_Date,
       cast(D.SupplierInvoiceItemAmount as abap.dec(15,2))                                                     as SupplierInvoiceItemAmount,
       D.ReverseDocument,
       // D.
       case
       when  D.ReverseDocument is not initial
       then 'Reversed'  else ' ' end                                                                           as SupplierInvoiceIDByInvcgParty,

       case
        when D.SupplierInvoiceStatus = 'D' then 'PERK'
        when D.SupplierInvoiceStatus = '5'  then 'POST' end                                                    as SupplierInvoiceStatus,

       //  c.GoodsMovementType,
       //       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       ''                                                                                                      as Quantity,
       //       @Semantics.amount.currencyCode: 'DocumentCurrency'
       ' '                                                                                                     as PurOrdAmountInCompanyCodeCrcy,


       a.PurchaseOrderQuantityUnit,
       //  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       cast( a.NetPriceAmount as abap.dec( 15, 3 ))                                                            as netprice,
       //a.PurchaseOrderQuantityUnit,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       cast( a.NetPriceQuantity  as abap.quan( 15, 3 ))                                                        as netqty,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       a.GrossAmount,
       case when a.GrossAmount >0 and a.OrderQuantity > 0 then
       //      a.GrossAmount / a.OrderQuantity
           cast( ((get_numeric_value(a.GrossAmount) / a.OrderQuantity )) as abap.dec( 15, 3 ) )
           else
           cast( a.GrossAmount as abap.dec( 15, 3 ))
           end                                                                                                 as zrate,


       // @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
       //cast( (division(a.OrderPriceUnitToOrderUnitNmrtr,a.OrdPriceUnitToOrderUnitDnmntr,3)*a.OrderQuantity )
       // as abap.quan( 10, 3 ) ) as order_qty_KG,

       // @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
       //cast( a.netpriceamount / a.OrdPriceUnitToOrderUnitDnmntr
       // as abap.quan( 10, 3 ) ) as rate,

       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       a.NetPriceQuantity,


       //  D.SupplierInvoice,
       //  D.SupplierInvoiceItem,
       //  D.FiscalYear,
       D.PostingDate                                                                                           as suplier_invoice_posting_dt,
       //  @Semantics.amount.currencyCode: 'DocumentCurrency'
       //  D.SupplierInvoiceItemAmount,
       //  D.SupplierInvoiceIDByInvcgParty,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       D.QtyInPurchaseOrderPriceUnit,
       concat(D.SupplierInvoice,D.FiscalYear)                                                                  as org_ref_inv_no,

       concat(concat(
           D.PrmtHbReferenceDocumentFsclYr,
           D.PrmtHbReferenceDocument ),D.PrmtHbReferenceDocumentItem)                                          as preref_buspart,
       D.PrmtHbReferenceDocumentItem,

       E.ReferenceDocument                                                                                     as gr_reference_doc,

       //--------------------------------------------------------------------------
       concat(concat(D.PrmtHbReferenceDocumentFsclYr,D.PrmtHbReferenceDocument),D.PrmtHbReferenceDocumentItem) as REFERENCE3IDBYBUSINESSPARTNER,
       f.SupplierName,
       f.CityName,
       f.Region
       
}
where a.PurchaseOrderItemCategory <> '7'
