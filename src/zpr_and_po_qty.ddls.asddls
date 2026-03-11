@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Req. and Po Qty'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPR_AND_PO_QTY as select from ZPR_AND_PO_QTY_1  as a 
{
    key a.PurchaseRequisition,
    key a.PurchaseRequisitionItem,
        a.PurchaseOrderQuantityUnit,
        @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit' 
        sum(a.OrderQuantity) as cons_qty
}
where a.ReleaseIsNotCompleted <> 'X'
group by a.PurchaseRequisition,
         a.PurchaseRequisitionItem,
         a.PurchaseOrderQuantityUnit
         

         
