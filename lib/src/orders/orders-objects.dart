import 'package:square_connect/square_connect.dart';

class Order {
  final String id;
  final String locationId;
  final String referenceId;
  final OrderSource source;
  final String customerId;
  final List<OrderLineItem> lineItems;
  final List<OrderLineItemTax> taxes;
  final List<OrderLineItemDiscount> discounts;
  final List<OrderServiceCharge> serviceCharges;
  final List<OrderFulfillment> fulfillments;
  // TODO final List<OrderReturn> returns;
  final OrderMoneyAmounts returnAmounts;
  final OrderMoneyAmounts netAmounts;
  final OrderRoundingAdjustment roundingAdjustment;
  // TODO final List<Tender> tenders;
  // TODO final List<Refund> refunds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime closedAt;
  final OrderState state;
  final Money totalMoney;
  final Money totalTaxMoney;
  final Money totalDiscountMoney;
  final Money totalServiceChargeMoney;

  Order({
    this.id,
    this.locationId,
    this.referenceId,
    this.source,
    this.customerId,
    this.lineItems,
    this.taxes,
    this.discounts,
    this.serviceCharges,
    this.fulfillments,
    this.returnAmounts,
    this.netAmounts,
    this.roundingAdjustment,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.state,
    this.totalMoney,
    this.totalTaxMoney,
    this.totalDiscountMoney,
    this.totalServiceChargeMoney,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      locationId: json['location_id'],
      referenceId: json['reference_id'],
      source: json['source'] != null ? OrderSource.fromJson(json['source']) : null,
      customerId: json['customer_id'],
      lineItems: json['line_items'] != null ? (json['line_items'] as List).map((item) => OrderLineItem.fromJson(item)).toList() : null,
      taxes: json['taxes'] != null ? (json['taxes'] as List).map((item) => OrderLineItemTax.fromJson(item)).toList() : null,
      discounts: json['discounts'] != null ? (json['discounts'] as List).map((item) => OrderLineItemDiscount.fromJson(item)).toList() : null,
      serviceCharges: json['service_charges'] != null ? (json['service_charges'] as List).map((item) => OrderServiceCharge.fromJson(item)).toList() : null,
      fulfillments: json['fulfillments'] != null ? (json['fulfillments'] as List).map((item) => OrderFulfillment.fromJson(item)).toList() : null,
      returnAmounts: json['return_amounts'] != null ? OrderMoneyAmounts.fromJson(json['return_amounts']) : null,
      netAmounts: json['net_amounts'] != null ? OrderMoneyAmounts.fromJson(json['net_amounts']) : null,
      roundingAdjustment: json['rounding_adjustment'] != null ? OrderRoundingAdjustment.fromJson(json['rounding_adjustment']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      closedAt: json['closed_at'] != null ? DateTime.parse(json['closed_at']) : null,
      state: json['state'] != null ? getOrderStateFromString(json['state']) : null,
      totalMoney: json['total_money'] != null ? Money.fromJson(json['total_money']) : null,
      totalTaxMoney: json['total_tax_money'] != null ? Money.fromJson(json['total_tax_money']) : null,
      totalDiscountMoney: json['total_discount_money'] != null ? Money.fromJson(json['total_discount_money']) : null,
      totalServiceChargeMoney: json['total_service_charge_money'] != null ? Money.fromJson(json['total_service_charge_money']) : null,
    );
  }
  
}

class OrderLineItem {
  final String uid;
  final String name;
  final double quantity;
  final OrderQuantityUnit orderQuantityUnit;
  final String note;
  final String catalogObjectId;
  final String variationName;
  final List<OrderLineItemModifier> modifiers;
  final List<OrderLineItemTax> taxes;
  final List<OrderLineItemDiscount> discounts;
  final Money basePriceMoney;
  final Money variationTotalPriceMoney;
  final Money grossSalesMoney;
  final Money totalTaxMoney;
  final Money totalDiscountMoney;
  final Money totalMoney;

  OrderLineItem({
    this.uid,
    this.name,
    this.quantity,
    this.orderQuantityUnit,
    this.note,
    this.catalogObjectId,
    this.variationName,
    this.modifiers,
    this.taxes,
    this.discounts,
    this.basePriceMoney,
    this.variationTotalPriceMoney,
    this.grossSalesMoney,
    this.totalTaxMoney,
    this.totalDiscountMoney,
    this.totalMoney
  });

  factory OrderLineItem.fromJson(Map<String, dynamic> json) {
    return OrderLineItem(
      uid: json['uid'],
      name: json['name'],
      quantity: json['quantity'],
      orderQuantityUnit: json['quantity_unit'] != null ? OrderQuantityUnit.fromJson(json['quantity_unit']) : null,
      note: json['note'],
      catalogObjectId: json['catalog_object_id'],
      variationName: json['variation_name'],
      modifiers: json['modifiers'] != null ? (json['modifiers'] as List).map((item) => OrderLineItemModifier.fromJson(item)).toList() : null,
      taxes: json['taxes'] != null ? (json['taxes'] as List).map((item) => OrderLineItemTax.fromJson(item)).toList() : null,
      discounts: json['discounts'] != null ? (json['discounts'] as List).map((item) => OrderLineItemDiscount.fromJson(item)).toList() : null,
      basePriceMoney: json['base_price_money'] != null ? Money.fromJson(json['base_price_money']) : null,
      variationTotalPriceMoney: json['variation_total_price_money'] != null ? Money.fromJson(json['variation_total_price_money']) : null,
      grossSalesMoney: json['gross_sales_money'] != null ? Money.fromJson(json['gross_sales_money']) : null,
      totalTaxMoney: json['total_tax_money'] != null ? Money.fromJson(json['total_tax_money']) : null,
      totalDiscountMoney: json['total_discount_money'] != null ? Money.fromJson(json['total_discount_money']) : null,
      totalMoney: json['total_money'] != null ? Money.fromJson(json['total_money']) : null,
    );
  }
}

class OrderLineItemTax {
  final String uid;
  final String catalogObjectId;
  final String name;
  final OrderLineItemTaxType type;
  final double percentage;
  final Money appliedMoney;
  final OrderLineItemTaxScope scope;

  OrderLineItemTax({
    this.uid,
    this.catalogObjectId,
    this.name,
    this.type,
    this.percentage,
    this.appliedMoney,
    this.scope
  });

  factory OrderLineItemTax.fromJson(Map<String, dynamic> json) {
    return OrderLineItemTax(
      uid: json['uid'],
      catalogObjectId: json['catalog_object_id'],
      name: json['name'],
      type: json['type'] != null ? getOrderLineItemTaxTypeFromString(json['type']) : null,
      percentage: json['percentage'] != null ? double.parse(json['percentage']) : null,
      appliedMoney: json['applied_money'] != null ? Money.fromJson(json['applied_money']) : null,
      scope: json['scope'] != null ? getOrderLineItemTaxScopeFromString(json['scope']) : null,
    );
  }
}

class OrderLineItemDiscount {
  final String uid;
  final String catalogObjectId;
  final String name;
  final OrderLineItemDiscountType type;
  final double percentage;
  final Money amountMoney;
  final Money appliedMoney;
  final OrderLineItemDiscountScope scope;

  OrderLineItemDiscount({
    this.uid,
    this.catalogObjectId,
    this.name,
    this.type,
    this.percentage,
    this.amountMoney,
    this.appliedMoney,
    this.scope
  });

  factory OrderLineItemDiscount.fromJson(Map<String, dynamic> json) {
    return OrderLineItemDiscount(
      uid: json['uid'],
      catalogObjectId: json['catalog_object_id'],
      name: json['name'],
      type: json['type'] != null ? getOrderLineItemDiscountTypeFromString(json['type']) : null,
      percentage: json['percentage'] != null ? double.parse(json['percentage']) : null,
      amountMoney: json['amount_money'] != null ? Money.fromJson(json['amount_money']) : null,
      appliedMoney: json['applied_money'] != null ? Money.fromJson(json['applied_money']) : null,
      scope: json['scope'] != null ? getOrderLineItemDiscountScopeFromString(json['scope']) : null,
    );
  }
}

class OrderLineItemModifier {
  final String uid;
  final String catalogObjectId;
  final String name;
  final Money basePriceMoney;
  final Money totalPriceMoney;

  OrderLineItemModifier({
    this.uid,
    this.catalogObjectId,
    this.name,
    this.basePriceMoney,
    this.totalPriceMoney
  });

  factory OrderLineItemModifier.fromJson(Map<String, dynamic> json) {
    return OrderLineItemModifier(
      uid: json['uid'],
      catalogObjectId: json['catalog_object_id'],
      name: json['name'],
      basePriceMoney: json['base_price_money'] != null ? Money.fromJson(json['base_price_money']) : null,
      totalPriceMoney:  json['total_price_money'] != null ? Money.fromJson(json['total_price_money']) : null,
    );
  }
}

class OrderServiceCharge {
  final String uid;
  final String name;
  final String catalogObjectId;
  final double percentage;
  final Money amountMoney;
  final Money appliedMoney;
  final Money totalMoney;
  final Money totalTaxMoney;
  final OrderServiceChargeCalculationPhase calculationPhase;
  final bool taxable;
  final List<OrderLineItemTax> taxes;

  OrderServiceCharge({
    this.uid,
    this.name,
    this.catalogObjectId,
    this.percentage,
    this.amountMoney,
    this.appliedMoney,
    this.totalMoney,
    this.totalTaxMoney,
    this.calculationPhase,
    this.taxable,
    this.taxes
  });

  factory OrderServiceCharge.fromJson(Map<String, dynamic> json) {
    return OrderServiceCharge(
      uid: json['uid'],
      name: json['name'],
      catalogObjectId: json['catalog_object_id'],
      percentage: json['percentage'] != null ? double.parse(json['percentage']) : null,
      amountMoney: json['amount_money'] != null ? Money.fromJson(json['amount_money']) : null,
      appliedMoney: json['applied_money'] != null ? Money.fromJson(json['applied_money']) : null,
      totalMoney: json['total_money'] != null ? Money.fromJson(json['total_money']) : null,
      totalTaxMoney: json['total_tax_money'] != null ? Money.fromJson(json['total_tax_money']) : null,
      calculationPhase: json['calculation_phase'] != null ? getOrderServiceChargeCalculationPhaseFromString(json['calculation_phase']) : null,
      taxable: json['taxable'],
      taxes: json['taxes'] != null ? (json['taxes'] as List).map((item) => OrderLineItemTax.fromJson(item)).toList() : null,
    );
  }
}

class OrderMoneyAmounts {
  final Money totalMoney;
  final Money taxMoney;
  final Money discountMoney;
  final Money tipMoney;
  final Money serviceChargeMoney;

  OrderMoneyAmounts({
    this.totalMoney,
    this.taxMoney,
    this.discountMoney,
    this.tipMoney,
    this.serviceChargeMoney
  });

  factory OrderMoneyAmounts.fromJson(Map<String, dynamic> json) {
    return OrderMoneyAmounts(
      totalMoney: json['total_money'] != null ? Money.fromJson(json['total_money']) : null,
      taxMoney: json['tax_money'] != null ? Money.fromJson(json['tax_money']) : null,
      discountMoney: json['discount_money'] != null ? Money.fromJson(json['discount_money']) : null,
      tipMoney: json['tip_money'] != null ? Money.fromJson(json['tip_money']) : null,
      serviceChargeMoney: json['service_charge_money'] != null ? Money.fromJson(json['service_charge_money']) : null,
    );
  }
}

class OrderSource {
  final String name;

  OrderSource({
    this.name
  });

  factory OrderSource.fromJson(Map<String, dynamic> json) {
    return OrderSource(
      name: json['name'],
    );
  }
}

class OrderQuantityUnit {
  final MeasurementUnit measurementUnit;
  final int precision;

  OrderQuantityUnit({
    this.measurementUnit,
    this.precision,
  });

  factory OrderQuantityUnit.fromJson(Map<String, dynamic> json) {
    return OrderQuantityUnit(
      measurementUnit: json['measurement_unit'] != null ? MeasurementUnit.fromJson(json['measurement_unit']) : null,
      precision: json['precision'],
    );
  }
}

class OrderFulfillment {
  final OrderFulfillmentType type;
  final OrderFulfillmentState state;
  final OrderFulfillmentPickupDetails pickupDetails;

  OrderFulfillment({
    this.type,
    this.state,
    this.pickupDetails
  });

  factory OrderFulfillment.fromJson(Map<String, dynamic> json) {
    return OrderFulfillment(
      type: json['type'] != null ? getOrderFulfillmentTypeFromString(json['type']) : null,
      state: json['state'] != null ? getOrderFulfillmentStateFromString(json['state']) : null, 
      pickupDetails: json['pickup_details'] != null ? OrderFulfillmentPickupDetails.fromJson(json['pickup_details']) : null, 
    );
  }
}

class OrderFulfillmentPickupDetails {
  final OrderFulfillmentRecipient recipient;
  final DateTime expiresAt;
  final String autoCompleteDuration;
  final OrderFulfillmentPickupDetailsScheduleType scheduleType;
  final DateTime pickupAt;
  final String pickupWindowDuration;
  final String prepTimeDuration;
  final String note;
  final DateTime placedAt;
  final DateTime acceptedAt;
  final DateTime rejectedAt;
  final DateTime readyAt;
  final DateTime expiredAt;
  final DateTime pickedUpAt;
  final DateTime canceledAt;
  final String cancelReason;

  OrderFulfillmentPickupDetails({
    this.recipient,
    this.expiresAt,
    this.autoCompleteDuration,
    this.scheduleType,
    this.pickupAt,
    this.pickupWindowDuration,
    this.prepTimeDuration,
    this.note,
    this.placedAt,
    this.acceptedAt,
    this.rejectedAt,
    this.readyAt,
    this.expiredAt,
    this.pickedUpAt,
    this.canceledAt,
    this.cancelReason
  });

  factory OrderFulfillmentPickupDetails.fromJson(Map<String, dynamic> json) {
    return OrderFulfillmentPickupDetails(
      recipient: json['recipient'] != null ? OrderFulfillmentRecipient.fromJson(json['recipient']) : null,
      expiresAt: json['expires_at'] != null ? DateTime.parse(json['expires_at']) : null,
      autoCompleteDuration: json['auto_complete_duration'],
      scheduleType: json['schedule_type'] != null ? getOrderFulfillmentPickupDetailsScheduleTypeFromString(json['schedule_type']) : null,
      pickupAt: json['pickup_at'] != null ? DateTime.parse(json['pickup_at']) : null,
      pickupWindowDuration: json['pickup_window_duration'],
      prepTimeDuration: json['prep_time_duration'],
      note: json['note'],
      placedAt: json['placed_at'] != null ? DateTime.parse(json['placed_at']) : null,
      acceptedAt: json['accepted_at'] != null ? DateTime.parse(json['accepted_at']) : null,
      rejectedAt: json['rejected_at'] != null ? DateTime.parse(json['rejected_at']) : null,
      readyAt: json['ready_at'] != null ? DateTime.parse(json['ready_at']) : null,
      expiredAt: json['expired_at'] != null ? DateTime.parse(json['expired_at']) : null,
      pickedUpAt: json['picked_up_at'] != null ? DateTime.parse(json['picked_up_at']) : null,
      canceledAt: json['canceled_at'] != null ? DateTime.parse(json['canceled_at']) : null,
      cancelReason: json['cancel_reason'],
    );
  }

}

class OrderFulfillmentRecipient {
  final String customerId;
  final String displayName;
  final String emailAddress;
  final String phoneNumber;

  OrderFulfillmentRecipient({
    this.customerId,
    this.displayName,
    this.emailAddress,
    this.phoneNumber
  });

  factory OrderFulfillmentRecipient.fromJson(Map<String, dynamic> json) {
    return OrderFulfillmentRecipient(
      customerId: json['customer_id'],
      displayName: json['display_name'],
      emailAddress: json['email_address'],
      phoneNumber: json['phone_number'],
    );
  }
}

class OrderRoundingAdjustment {
  final String uid;
  final String name;
  final Money amountMoney;

  OrderRoundingAdjustment({
    this.uid,
    this.name,
    this.amountMoney
  });

  factory OrderRoundingAdjustment.fromJson(Map<String, dynamic> json) {
    return OrderRoundingAdjustment(
      uid: json['uid'],
      name: json['name'],
      amountMoney: json['amount_money'] != null ? Money.fromJson(json['amount_money']) : null,
    );
  }
}

/// Helper class to create order object line items.
class CreateOrderLineItemObject{
  double quantity;
  String note;
  String catalogVariationId;
  List<String> modifierIds;
  List<String> taxIds;
  List<String> discountIds;
  
  
  Map<String, dynamic> toMap() {
    var body = Map<String, dynamic>();
    if(quantity != null) body['quantity'] = quantity;
    if(note != null) body['note'] = note;
    if(catalogVariationId != null) body['catalog_object_id'] = catalogVariationId;
    if(modifierIds != null) body['modifiers'] = modifierIds.map((id) => {'catalog_object_id': id}).toList();
    if(taxIds != null) body['taxes'] = taxIds.map((id) => {'catalog_object_id': id}).toList();
    if(discountIds != null) body['discounts'] = discountIds.map((id) => {'catalog_object_id': id}).toList();

    return body;
  }
}