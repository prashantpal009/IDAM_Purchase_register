@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'WITH HOLDING TAX'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZWITHOLDING_TAX 
 as select from I_OperationalAcctgDocItem
{
  key OriginalReferenceDocument,
         
  cast( '000001' as abap.char(6) ) as LINE_NO,

  min(
    case
      when TransactionTypeDetermination = 'WIT'
       and WithholdingTaxCode = '4Q'
      then cast( AmountInTransactionCurrency as abap.dec(15,2) )
    end
  ) as TDS_194Q,

  min(
    case
      when TransactionTypeDetermination = 'WIT'
       and WithholdingTaxCode = 'C0'
      then cast( AmountInTransactionCurrency as abap.dec(15,2) )
    end
  ) as TDS_194C,

  min(
    case
      when TransactionTypeDetermination = 'WIT'
       and WithholdingTaxCode = 'J0'
      then cast( AmountInTransactionCurrency as abap.dec(15,2) )
    end
  ) as TDS_194J,

  min(
    case
      when TransactionTypeDetermination = 'WIT'
       and WithholdingTaxCode = 'I0'
      then cast( AmountInTransactionCurrency as abap.dec(15,2) )
    end
  ) as TDS_194I,

  min(
    case
      when TransactionTypeDetermination = 'WIT'
       and WithholdingTaxCode = 'XB'
      then cast( AmountInTransactionCurrency as abap.dec(15,2) )
    end
  ) as TDS_194JB
}
group by
  OriginalReferenceDocument
