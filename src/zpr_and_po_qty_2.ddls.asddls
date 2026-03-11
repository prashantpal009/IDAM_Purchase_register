@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Req. and Po Qty'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPR_AND_PO_QTY_2 as select from ZPR_AND_PO_QTY as a left outer join I_PurchaseRequisitionItemAPI01 as b
                         on a.PurchaseRequisition = b.PurchaseRequisition 
                        and a.PurchaseRequisitionItem = b.PurchaseRequisitionItem
{
    key a.PurchaseRequisition,
    key a.PurchaseRequisitionItem,
        a.PurchaseOrderQuantityUnit,
        b.BaseUnit,
        @Semantics.quantity.unitOfMeasure: 'BaseUnit'
        b.RequestedQuantity,
        @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit' 
        a.cons_qty,
        cast((b.RequestedQuantity - a.cons_qty) as abap.dec( 13, 3 )) as remain_qty
}
where a.PurchaseRequisition <> ''
