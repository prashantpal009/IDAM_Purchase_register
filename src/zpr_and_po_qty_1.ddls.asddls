@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Pr and PO qty'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPR_AND_PO_QTY_1 as select from I_PurchaseOrderItemAPI01 as a  left outer join I_PurchaseOrderAPI01 as b on a.PurchaseOrder = b.PurchaseOrder
{
    key a.PurchaseRequisition,
    key a.PurchaseRequisitionItem,
        a.PurchaseOrderQuantityUnit,
        b.ReleaseIsNotCompleted,
        @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit' 
        a.OrderQuantity
}


         
