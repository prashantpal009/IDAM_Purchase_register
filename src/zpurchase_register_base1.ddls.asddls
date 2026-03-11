@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register Base1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPurchase_Register_BASE1
  as select from    ZPURCHASE_REGISTER_BASE        as a
    left outer join ZPURCHASE_REG_TAX              as b  on  b.OriginalReferenceDocument = a.org_ref_inv_no
                                                         and b.SupplierInvoiceItem       = a.SupplierInvoiceItem


    left outer join I_PurOrdItmPricingElementAPI01 as f  on  f.PurchaseOrder     = a.PurchaseOrder
                                                         and f.PurchaseOrderItem = a.PurchaseOrderItem
                                                         and f.PricingDocument   = a.PricingDocument
                                                         and (
                                                            f.ConditionType      = 'ZFP1'
                                                            or f.ConditionType   = 'ZFQ1'
                                                            or f.ConditionType   = 'ZFV1'
                                                          )
                                                         and f.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as g  on  g.PurchaseOrder     = a.PurchaseOrder
                                                         and g.PurchaseOrderItem = a.PurchaseOrderItem
                                                         and g.PricingDocument   = a.PricingDocument
                                                         and (
                                                            g.ConditionType      = 'ZPFP'
                                                            or g.ConditionType   = 'ZPFQ'
                                                            or g.ConditionType   = 'ZPFV'
                                                          )
                                                         and g.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as h  on  h.PurchaseOrder     = a.PurchaseOrder
                                                         and h.PurchaseOrderItem = a.PurchaseOrderItem
                                                         and h.PricingDocument   = a.PricingDocument
                                                         and (
                                                            h.ConditionType      = 'ZINP'
                                                            or h.ConditionType   = 'ZINQ'
                                                            or h.ConditionType   = 'ZINV'
                                                          )
                                                         and h.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as i  on  i.PurchaseOrder     = a.PurchaseOrder
                                                         and i.PurchaseOrderItem = a.PurchaseOrderItem
                                                         and i.PricingDocument   = a.PricingDocument
                                                         and (
                                                            i.ConditionType      = 'ZHDP'
                                                            or i.ConditionType   = 'ZHDQ'
                                                            or i.ConditionType   = 'ZHDV'
                                                          )
                                                         and i.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as j  on  j.PurchaseOrder     = a.PurchaseOrder
                                                         and j.PurchaseOrderItem = a.PurchaseOrderItem
                                                         and j.PricingDocument   = a.PricingDocument
                                                         and (
                                                            j.ConditionType      = 'ZLDP'
                                                            or j.ConditionType   = 'ZLDQ'
                                                            or j.ConditionType   = 'ZLDV'
                                                          )
                                                         and j.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as k  on  k.PurchaseOrder     = a.PurchaseOrder
                                                         and k.PurchaseOrderItem = a.PurchaseOrderItem
                                                         and k.PricingDocument   = a.PricingDocument
                                                         and (
                                                            k.ConditionType      = 'ZOTP'
                                                            or k.ConditionType   = 'ZOTQ'
                                                            or k.ConditionType   = 'ZOTV'
                                                          )
                                                         and k.ConditionAmount   > 0


    left outer join I_PurOrdItmPricingElementAPI01 as l  on  a.PurchaseOrder     = l.PurchaseOrder
                                                         and a.PurchaseOrderItem = l.PurchaseOrderItem
                                                         and a.PricingDocument   = l.PricingDocument
                                                         and (
                                                            l.ConditionType      = 'ZAUP'
                                                            or l.ConditionType   = 'ZAUQ'
                                                            or l.ConditionType   = 'ZAUV'
                                                          )
                                                         and l.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as m  on  a.PurchaseOrder     = m.PurchaseOrder
                                                         and a.PurchaseOrderItem = m.PurchaseOrderItem
                                                         and a.PricingDocument   = m.PricingDocument
                                                         and (
                                                            m.ConditionType      = 'ZCLP'
                                                            or m.ConditionType   = 'ZCLQ'
                                                            or m.ConditionType   = 'ZCLV'
                                                          )
                                                         and m.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as n  on  a.PurchaseOrder     = n.PurchaseOrder
                                                         and a.PurchaseOrderItem = n.PurchaseOrderItem
                                                         and a.PricingDocument   = n.PricingDocument
                                                         and (
                                                            n.ConditionType      = 'ZIFP'
                                                            or n.ConditionType   = 'ZIFQ'
                                                            or n.ConditionType   = 'ZIFV'
                                                          )
                                                         and n.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as o  on  a.PurchaseOrder     = o.PurchaseOrder
                                                         and a.PurchaseOrderItem = o.PurchaseOrderItem
                                                         and a.PricingDocument   = o.PricingDocument
                                                         and (
                                                            o.ConditionType      = 'ZIIP'
                                                            or o.ConditionType   = 'ZIIQ'
                                                            or o.ConditionType   = 'ZIIV'
                                                          )
                                                         and o.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as p  on  a.PurchaseOrder     = p.PurchaseOrder
                                                         and a.PurchaseOrderItem = p.PurchaseOrderItem
                                                         and a.PricingDocument   = p.PricingDocument
                                                         and (
                                                            p.ConditionType      = 'ZLCP'
                                                            or p.ConditionType   = 'ZLCQ'
                                                            or p.ConditionType   = 'ZLCV'
                                                          )
                                                         and p.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as q  on  a.PurchaseOrder     = q.PurchaseOrder
                                                         and a.PurchaseOrderItem = q.PurchaseOrderItem
                                                         and a.PricingDocument   = q.PricingDocument
                                                         and (
                                                            q.ConditionType      = 'ZLTP'
                                                            or q.ConditionType   = 'ZLTQ'
                                                            or q.ConditionType   = 'ZLTV'
                                                          )
                                                         and q.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as r  on  a.PurchaseOrder     = r.PurchaseOrder
                                                         and a.PurchaseOrderItem = r.PurchaseOrderItem
                                                         and a.PricingDocument   = r.PricingDocument
                                                         and r.ConditionType     = 'ZIPV'
                                                         and r.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as s  on  a.PurchaseOrder     = s.PurchaseOrder
                                                         and a.PurchaseOrderItem = s.PurchaseOrderItem
                                                         and a.PricingDocument   = s.PricingDocument
                                                         and s.ConditionType     = 'ZBCD'
                                                         and s.ConditionAmount   > 0

    left outer join I_PurOrdItmPricingElementAPI01 as t  on  a.PurchaseOrder     = t.PurchaseOrder
                                                         and a.PurchaseOrderItem = t.PurchaseOrderItem
                                                         and a.PricingDocument   = t.PricingDocument
                                                         and t.ConditionType     = 'ZSWS'
                                                         and t.ConditionAmount   > 0

    left outer join I_OperationalAcctgDocItem      as u  on  u.OriginalReferenceDocument     = a.org_ref_inv_no
                                                         and u.Reference3IDByBusinessPartner = a.REFERENCE3IDBYBUSINESSPARTNER
                                                         and u.PurchasingDocument            = a.PurchaseOrder
                                                         and u.PurchasingDocumentItem        = a.PurchaseOrderItem
                                                         and u.TransactionTypeDetermination  = 'WRX'
    left outer join I_OperationalAcctgDocItem      as V  on  V.OriginalReferenceDocument    = a.org_ref_inv_no //'51056001142023'// concat(D.SupplierInvoice,D.FiscalYear)
                                                         and V.TaxItemAcctgDocItemRef       = a.SupplierInvoiceItem
                                                         and V.TransactionTypeDetermination = 'JCI'
                                                         and V.AccountingDocumentItemType   = 'T'

    left outer join I_MaterialDocumentItem_2       as w  on  w.MaterialDocument     = a.PURCHASINGHISTORYDOCUMENT
                                                         and w.MaterialDocumentItem = a.PURCHASINGHISTORYDOCUMENTITEM
                                                         and w.MaterialDocumentYear = a.PURCHASINGHISTORYDOCUMENTYEAR
                                                         and w.PurchaseOrder        = a.PurchaseOrder
                                                         and w.PurchaseOrderItem    = a.PurchaseOrderItem

    left outer join ZPurchase_Register_BASE2       as x  on  x.OriginalReferenceDocument = a.org_ref_inv_no
                                                         and x.PurchasingDocument        = a.PurchaseOrder
                                                         and x.PurchasingDocumentItem    = a.PurchaseOrderItem

    left outer join I_OperationalAcctgDocItem      as x1 on  x1.OriginalReferenceDocument    = a.org_ref_inv_no
                                                         and x1.PurchasingDocument           = a.PurchaseOrder
                                                         and x1.PurchasingDocumentItem       = a.PurchaseOrderItem
                                                         and x1.TransactionTypeDetermination = 'BSX'
                                                         and x1.AccountingDocumentItemType   = 'M'

    left outer join I_OperationalAcctgDocItem      as y  on  y.PurchasingDocument           = a.PurchaseOrder
                                                         and y.PurchasingDocumentItem       = a.PurchaseOrderItem
                                                         and y.OriginalReferenceDocument    = a.org_ref_inv_no
                                                         and y.CompanyCode                  = a.CompanyCode
                                                         and y.TransactionTypeDetermination = 'FR1'

    left outer join I_Supplier                     as z  on z.Supplier = y.Supplier

  //left outer join I_OperationalAcctgDocItem as Y on Y.OriginalReferenceDocument = a.org_ref_inv_no and Y.PurchasingDocument = a.PurchaseOrder
  //and Y.PurchasingDocumentItem = a.PurchaseOrderItem and Y.TransactionTypeDetermination = 'FR1'
{

  key  a.PurchaseOrder,
  key  a.PurchaseOrderItem,
  key  a.PURCHASINGHISTORYDOCUMENT,
  key  a.Material,
       a.PurchaseOrderType,
       a.PurchaseOrderItemCategory,
       a.PurchaseOrderDate,
       a.CorrespncExternalReference,
       a.CorrespncInternalReference,
       a.PurchasingOrganization,
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
       //  @Semantics.amount.currencyCode: 'DocumentCurrency'
       a.netprice,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       a.NetAmount,
        a.PurchaseRequisition,
       a.PurchaseRequisitionItem,
//       a.PurchasingHistoryDocument,
       a.PURCHASINGHISTORYDOCUMENTYEAR,
       a.PURCHASINGHISTORYDOCUMENTITEM,
       a.PostingDate,
       a.gr_header_text,
       a.BillOfLading                                           as BillOfLading,
       a.DeliveryDocument,
       a.MaterialDocumentItemText,
       a.StorageLocation,
       a.ManufactureDate,
       a.ShelfLifeExpirationDate,
       a.Batch,
       a.TotalGdsMvtQtyInBaseUnit,
       a.GoodsMovementType,
//       a.IsEffectiveGoodsMovement,
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
       //    a.GoodsMovementType,
//       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
//       a.Quantity,
//       @Semantics.amount.currencyCode: 'DocumentCurrency'
//       a.PurOrdAmountInCompanyCodeCrcy,
       a.suplier_invoice_posting_dt,
       a.gr_reference_doc,
       a.org_ref_inv_no,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.CGST                                                   as cgst,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.SGST                                                   as sgst,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.IGST                                                   as igst,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.EXT_FCGST,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.EXT_FSGST,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.EXT_FIGST,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.TDS_194Q,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.TDS_194C,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.TDS_194J,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.TDS_194I,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       b.TDS_194JB,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       V.AmountInTransactionCurrency                            as CESS,
       b.TaxCode                                                as sup_tax_code,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       x1.AmountInTransactionCurrency                           as EXT_FRT,

       @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
       case
       when a.netprice > 0 and a.netqty   > 0 then 
       cast(a.netprice / a.netqty as abap.dec(23,3))
       else 
       cast( 0.000 as abap.dec(23,3) )   end                 as rate,
       
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       f.ConditionAmount                                        as Dom_Freight,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       g.ConditionAmount                                        as Dom_Pack_Ford,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       h.ConditionAmount                                        as Dom_Insurance,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       i.ConditionAmount                                        as Dom_Handling,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       j.ConditionAmount                                        as Dom_Load_Unload,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       k.ConditionAmount                                        as Dom_Other,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       l.ConditionAmount                                        as IMP_AirportAuth,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       m.ConditionAmount                                        as IMP_Clearing,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       n.ConditionAmount                                        as IMP_Freight,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       o.ConditionAmount                                        as IMP_Insurance,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       p.ConditionAmount                                        as IMP_Loc_Destina,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       q.ConditionAmount                                        as IMP_Loc_Trans,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       r.ConditionAmount                                        as IMP_Inspection,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       s.ConditionAmount                                        as Basic_Custom_duty,
       @Semantics.amount.currencyCode: 'DocumentCurrency'
       t.ConditionAmount                                        as Social_welfare_cess,
       case when a.TaxCode = 'AA' and a.NetAmount > 0
          then
           cast( ((get_numeric_value(a.NetAmount) / 100 ) * 5) as abap.dec( 12, 3 ) )
          when a.TaxCode = 'AB' and a.NetAmount > 0 then
          cast( ((get_numeric_value(a.NetAmount) / 100 ) * 12) as abap.dec( 12, 3 ) )
          when a.TaxCode = 'AC' and a.NetAmount > 0 then
          cast( ((get_numeric_value(a.NetAmount) / 100 ) * 18) as abap.dec( 12, 3 ) )
          when a.TaxCode = 'AD' and a.NetAmount > 0 then
          cast( ((get_numeric_value(a.NetAmount) / 100 ) * 28) as abap.dec( 12, 3 ) )
          end                                                   as CGST_value,

       case when a.TaxCode = 'AI' and a.NetAmount > 0 then
         cast( ((get_numeric_value(a.NetAmount) / 100 ) * 5) as abap.dec( 12, 3 ) )
          when a.TaxCode = 'AJ' and a.NetAmount > 0 then
          cast( ((get_numeric_value(a.NetAmount) / 100 ) * 12) as abap.dec( 12, 3 ) )
          when a.TaxCode = 'AK' and a.NetAmount > 0 then
          cast( ((get_numeric_value(a.NetAmount) / 100 ) * 18) as abap.dec( 12, 3 ) )
          when a.TaxCode = 'AL' and a.NetAmount > 0 then
          cast( ((get_numeric_value(a.NetAmount) / 100 ) * 28) as abap.dec( 12, 3 ) )
       //       else
       //       cast( ((get_numeric_value(a.NetAmount) * 1)) as abap.dec( 12, 2 ) )
          end                                                   as IGST_value,

       case when a.TaxCode = 'AA' then
        cast( '2.5' as abap.dec( 12, 2 ))
        when a.TaxCode = 'AB' then
        cast( '6' as abap.dec( 12, 2 ))
        when a.TaxCode = 'AC' then
        cast( '9' as abap.dec( 12, 2 ))
        when (a.TaxCode = 'AD'  ) then
        cast( '14' as abap.dec( 12, 2 ))
        end                                                     as CGST_RATE,

       case when a.TaxCode = 'AI' then
       cast( '5' as abap.dec( 12, 2 ))
        when a.TaxCode = 'AJ' then
        cast( '12' as abap.dec( 12, 2 ))
        when a.TaxCode = 'AK' then
        cast( '18' as abap.dec( 12, 2 ))
        when (a.TaxCode = 'AL' ) then
        cast( '28' as abap.dec( 12, 2 ))
        end                                                     as IGST_RATE,

       a.zrate,
       //       @Semantics.amount.currencyCode: 'DocumentCurrency'
//       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
//       case when a.Quantity > 0 then
//           cast(a.zrate * a.Quantity as abap.dec( 23, 3 ) ) 
//           end                                                  as ZGR_AMT,
       u.AccountingDocument                                     as FI_DOCUMNET_NO,
       u.FiscalYear                                             as FI_DOCUMENT_YEAR,
       u.DocumentDate                                           as FI_DOCUMENT_POST_DATE,
       u.TaxItemAcctgDocItemRef                                 as TAXITEMREF,
       u.CompanyCodeCurrency,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       a.QtyInPurchaseOrderPriceUnit,
       w.UnloadingPointName                                     as form_name,
       //       (coalesce(abs(get_numeric_value(x.AmountInCompanyCodeCurrency )),0)) +
       //       (coalesce(abs(get_numeric_value(Y.AmountInCompanyCodeCurrency )),0)) as net_amount
       //       case when x.AMOUNTINCOMPANYCODECURRENCY > 0
       @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
       x.net_amount                                             as net_amount,
       cast(x.net_amount as abap.dec( 23, 2 ))                  as frd_amt,
       x.GoodsMovementEntryUnit,
       @Semantics: { quantity : {unitOfMeasure: 'GoodsMovementEntryUnit'} }
       x.QuantityInEntryUnit,
       cast(x.QuantityInEntryUnit as abap.dec( 23, 3 ))         as qty_ety_unt,
       cast(a.QtyInPurchaseOrderPriceUnit as abap.dec( 13, 3 )) as miro_qty,
       a.SupplierName,
       a.CityName,
       a.Region,
       y.Supplier                                               as frg_Supplier,
       z.SupplierName                                           as frg_Supplier_name




}

