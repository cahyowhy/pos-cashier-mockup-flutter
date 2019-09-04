// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _OrderBean implements Bean<Order> {
  final transactionId = StrField('transaction_id');
  final orderId = IntField('order_id');
  final serviceCharge = IntField('service_charge');
  final promoDiscount = IntField('promo_discount');
  final salesDiscount = IntField('sales_discount');
  final shiftId = IntField('shift_id');
  final createdId = IntField('created_id');
  final placeId = IntField('place_id');
  final subTotal = DoubleField('sub_total');
  final cash = DoubleField('cash');
  final change = DoubleField('change');
  final ppn = DoubleField('ppn');
  final grandTotal = DoubleField('grand_total');
  final transactionTime = IntField('transaction_time');
  final paymentTypeId = IntField('payment_type_id');
  final paymentTypeJson = StrField('payment_type_json');
  final serviceTypeId = IntField('service_type_id');
  final serviceTypeJson = StrField('service_type_json');
  final reservationId = IntField('reservation_id');
  final reservationName = StrField('reservation_name');
  final reservationJson = StrField('reservation_json');
  final customerName = StrField('customer_name');
  final uniqShiftId = StrField('uniq_shift_id');
  final placeName = StrField('place_name');
  final clientId = StrField('client_id');
  final senderId = StrField('sender_id');
  final serveBy = StrField('serve_by');
  final synchronize = BoolField('synchronize');
  final isReservation = BoolField('is_reservation');
  final isAllFinish = BoolField('is_all_finish');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        transactionId.name: transactionId,
        orderId.name: orderId,
        serviceCharge.name: serviceCharge,
        promoDiscount.name: promoDiscount,
        salesDiscount.name: salesDiscount,
        shiftId.name: shiftId,
        createdId.name: createdId,
        placeId.name: placeId,
        subTotal.name: subTotal,
        cash.name: cash,
        change.name: change,
        ppn.name: ppn,
        grandTotal.name: grandTotal,
        transactionTime.name: transactionTime,
        paymentTypeId.name: paymentTypeId,
        paymentTypeJson.name: paymentTypeJson,
        serviceTypeId.name: serviceTypeId,
        serviceTypeJson.name: serviceTypeJson,
        reservationId.name: reservationId,
        reservationName.name: reservationName,
        reservationJson.name: reservationJson,
        customerName.name: customerName,
        uniqShiftId.name: uniqShiftId,
        placeName.name: placeName,
        clientId.name: clientId,
        senderId.name: senderId,
        serveBy.name: serveBy,
        synchronize.name: synchronize,
        isReservation.name: isReservation,
        isAllFinish.name: isAllFinish,
      };
  Order fromMap(Map map) {
    Order model = Order();
    model.transactionId = adapter.parseValue(map['transaction_id']);
    model.orderId = adapter.parseValue(map['order_id']);
    model.serviceCharge = adapter.parseValue(map['service_charge']);
    model.promoDiscount = adapter.parseValue(map['promo_discount']);
    model.salesDiscount = adapter.parseValue(map['sales_discount']);
    model.shiftId = adapter.parseValue(map['shift_id']);
    model.createdId = adapter.parseValue(map['created_id']);
    model.placeId = adapter.parseValue(map['place_id']);
    model.subTotal = adapter.parseValue(map['sub_total']);
    model.cash = adapter.parseValue(map['cash']);
    model.change = adapter.parseValue(map['change']);
    model.ppn = adapter.parseValue(map['ppn']);
    model.grandTotal = adapter.parseValue(map['grand_total']);
    model.transactionTime = adapter.parseValue(map['transaction_time']);
    model.paymentTypeId = adapter.parseValue(map['payment_type_id']);
    model.paymentTypeJson = adapter.parseValue(map['payment_type_json']);
    model.serviceTypeId = adapter.parseValue(map['service_type_id']);
    model.serviceTypeJson = adapter.parseValue(map['service_type_json']);
    model.reservationId = adapter.parseValue(map['reservation_id']);
    model.reservationName = adapter.parseValue(map['reservation_name']);
    model.reservationJson = adapter.parseValue(map['reservation_json']);
    model.customerName = adapter.parseValue(map['customer_name']);
    model.uniqShiftId = adapter.parseValue(map['uniq_shift_id']);
    model.placeName = adapter.parseValue(map['place_name']);
    model.clientId = adapter.parseValue(map['client_id']);
    model.senderId = adapter.parseValue(map['sender_id']);
    model.serveBy = adapter.parseValue(map['serve_by']);
    model.synchronize = adapter.parseValue(map['synchronize']);
    model.isReservation = adapter.parseValue(map['is_reservation']);
    model.isAllFinish = adapter.parseValue(map['is_all_finish']);

    return model;
  }

  List<SetColumn> toSetColumns(Order model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(transactionId.set(model.transactionId));
      ret.add(orderId.set(model.orderId));
      ret.add(serviceCharge.set(model.serviceCharge));
      ret.add(promoDiscount.set(model.promoDiscount));
      ret.add(salesDiscount.set(model.salesDiscount));
      ret.add(shiftId.set(model.shiftId));
      ret.add(createdId.set(model.createdId));
      ret.add(placeId.set(model.placeId));
      ret.add(subTotal.set(model.subTotal));
      ret.add(cash.set(model.cash));
      ret.add(change.set(model.change));
      ret.add(ppn.set(model.ppn));
      ret.add(grandTotal.set(model.grandTotal));
      ret.add(transactionTime.set(model.transactionTime));
      ret.add(paymentTypeId.set(model.paymentTypeId));
      ret.add(paymentTypeJson.set(model.paymentTypeJson));
      ret.add(serviceTypeId.set(model.serviceTypeId));
      ret.add(serviceTypeJson.set(model.serviceTypeJson));
      ret.add(reservationId.set(model.reservationId));
      ret.add(reservationName.set(model.reservationName));
      ret.add(reservationJson.set(model.reservationJson));
      ret.add(customerName.set(model.customerName));
      ret.add(uniqShiftId.set(model.uniqShiftId));
      ret.add(placeName.set(model.placeName));
      ret.add(clientId.set(model.clientId));
      ret.add(senderId.set(model.senderId));
      ret.add(serveBy.set(model.serveBy));
      ret.add(synchronize.set(model.synchronize));
      ret.add(isReservation.set(model.isReservation));
      ret.add(isAllFinish.set(model.isAllFinish));
    } else if (only != null) {
      if (only.contains(transactionId.name))
        ret.add(transactionId.set(model.transactionId));
      if (only.contains(orderId.name)) ret.add(orderId.set(model.orderId));
      if (only.contains(serviceCharge.name))
        ret.add(serviceCharge.set(model.serviceCharge));
      if (only.contains(promoDiscount.name))
        ret.add(promoDiscount.set(model.promoDiscount));
      if (only.contains(salesDiscount.name))
        ret.add(salesDiscount.set(model.salesDiscount));
      if (only.contains(shiftId.name)) ret.add(shiftId.set(model.shiftId));
      if (only.contains(createdId.name))
        ret.add(createdId.set(model.createdId));
      if (only.contains(placeId.name)) ret.add(placeId.set(model.placeId));
      if (only.contains(subTotal.name)) ret.add(subTotal.set(model.subTotal));
      if (only.contains(cash.name)) ret.add(cash.set(model.cash));
      if (only.contains(change.name)) ret.add(change.set(model.change));
      if (only.contains(ppn.name)) ret.add(ppn.set(model.ppn));
      if (only.contains(grandTotal.name))
        ret.add(grandTotal.set(model.grandTotal));
      if (only.contains(transactionTime.name))
        ret.add(transactionTime.set(model.transactionTime));
      if (only.contains(paymentTypeId.name))
        ret.add(paymentTypeId.set(model.paymentTypeId));
      if (only.contains(paymentTypeJson.name))
        ret.add(paymentTypeJson.set(model.paymentTypeJson));
      if (only.contains(serviceTypeId.name))
        ret.add(serviceTypeId.set(model.serviceTypeId));
      if (only.contains(serviceTypeJson.name))
        ret.add(serviceTypeJson.set(model.serviceTypeJson));
      if (only.contains(reservationId.name))
        ret.add(reservationId.set(model.reservationId));
      if (only.contains(reservationName.name))
        ret.add(reservationName.set(model.reservationName));
      if (only.contains(reservationJson.name))
        ret.add(reservationJson.set(model.reservationJson));
      if (only.contains(customerName.name))
        ret.add(customerName.set(model.customerName));
      if (only.contains(uniqShiftId.name))
        ret.add(uniqShiftId.set(model.uniqShiftId));
      if (only.contains(placeName.name))
        ret.add(placeName.set(model.placeName));
      if (only.contains(clientId.name)) ret.add(clientId.set(model.clientId));
      if (only.contains(senderId.name)) ret.add(senderId.set(model.senderId));
      if (only.contains(serveBy.name)) ret.add(serveBy.set(model.serveBy));
      if (only.contains(synchronize.name))
        ret.add(synchronize.set(model.synchronize));
      if (only.contains(isReservation.name))
        ret.add(isReservation.set(model.isReservation));
      if (only.contains(isAllFinish.name))
        ret.add(isAllFinish.set(model.isAllFinish));
    } else /* if (onlyNonNull) */ {
      if (model.transactionId != null) {
        ret.add(transactionId.set(model.transactionId));
      }
      if (model.orderId != null) {
        ret.add(orderId.set(model.orderId));
      }
      if (model.serviceCharge != null) {
        ret.add(serviceCharge.set(model.serviceCharge));
      }
      if (model.promoDiscount != null) {
        ret.add(promoDiscount.set(model.promoDiscount));
      }
      if (model.salesDiscount != null) {
        ret.add(salesDiscount.set(model.salesDiscount));
      }
      if (model.shiftId != null) {
        ret.add(shiftId.set(model.shiftId));
      }
      if (model.createdId != null) {
        ret.add(createdId.set(model.createdId));
      }
      if (model.placeId != null) {
        ret.add(placeId.set(model.placeId));
      }
      if (model.subTotal != null) {
        ret.add(subTotal.set(model.subTotal));
      }
      if (model.cash != null) {
        ret.add(cash.set(model.cash));
      }
      if (model.change != null) {
        ret.add(change.set(model.change));
      }
      if (model.ppn != null) {
        ret.add(ppn.set(model.ppn));
      }
      if (model.grandTotal != null) {
        ret.add(grandTotal.set(model.grandTotal));
      }
      if (model.transactionTime != null) {
        ret.add(transactionTime.set(model.transactionTime));
      }
      if (model.paymentTypeId != null) {
        ret.add(paymentTypeId.set(model.paymentTypeId));
      }
      if (model.paymentTypeJson != null) {
        ret.add(paymentTypeJson.set(model.paymentTypeJson));
      }
      if (model.serviceTypeId != null) {
        ret.add(serviceTypeId.set(model.serviceTypeId));
      }
      if (model.serviceTypeJson != null) {
        ret.add(serviceTypeJson.set(model.serviceTypeJson));
      }
      if (model.reservationId != null) {
        ret.add(reservationId.set(model.reservationId));
      }
      if (model.reservationName != null) {
        ret.add(reservationName.set(model.reservationName));
      }
      if (model.reservationJson != null) {
        ret.add(reservationJson.set(model.reservationJson));
      }
      if (model.customerName != null) {
        ret.add(customerName.set(model.customerName));
      }
      if (model.uniqShiftId != null) {
        ret.add(uniqShiftId.set(model.uniqShiftId));
      }
      if (model.placeName != null) {
        ret.add(placeName.set(model.placeName));
      }
      if (model.clientId != null) {
        ret.add(clientId.set(model.clientId));
      }
      if (model.senderId != null) {
        ret.add(senderId.set(model.senderId));
      }
      if (model.serveBy != null) {
        ret.add(serveBy.set(model.serveBy));
      }
      if (model.synchronize != null) {
        ret.add(synchronize.set(model.synchronize));
      }
      if (model.isReservation != null) {
        ret.add(isReservation.set(model.isReservation));
      }
      if (model.isAllFinish != null) {
        ret.add(isAllFinish.set(model.isAllFinish));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(transactionId.name, primary: true, isNullable: false);
    st.addInt(orderId.name, isNullable: true);
    st.addInt(serviceCharge.name, isNullable: true);
    st.addInt(promoDiscount.name, isNullable: true);
    st.addInt(salesDiscount.name, isNullable: true);
    st.addInt(shiftId.name, isNullable: true);
    st.addInt(createdId.name, isNullable: true);
    st.addInt(placeId.name, isNullable: true);
    st.addDouble(subTotal.name, isNullable: true);
    st.addDouble(cash.name, isNullable: true);
    st.addDouble(change.name, isNullable: true);
    st.addDouble(ppn.name, isNullable: true);
    st.addDouble(grandTotal.name, isNullable: true);
    st.addInt(transactionTime.name, isNullable: true);
    st.addInt(paymentTypeId.name, isNullable: true);
    st.addStr(paymentTypeJson.name, isNullable: false);
    st.addInt(serviceTypeId.name, isNullable: true);
    st.addStr(serviceTypeJson.name, isNullable: true);
    st.addInt(reservationId.name, isNullable: true);
    st.addStr(reservationName.name, isNullable: true);
    st.addStr(reservationJson.name, isNullable: false);
    st.addStr(customerName.name, isNullable: true);
    st.addStr(uniqShiftId.name, isNullable: true);
    st.addStr(placeName.name, isNullable: true);
    st.addStr(clientId.name, isNullable: true);
    st.addStr(senderId.name, isNullable: true);
    st.addStr(serveBy.name, isNullable: true);
    st.addBool(synchronize.name, isNullable: true);
    st.addBool(isReservation.name, isNullable: true);
    st.addBool(isAllFinish.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Order model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<Order> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Order model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<Order> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(Order model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.transactionId.eq(model.transactionId))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Order> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.transactionId.eq(model.transactionId));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Order> find(String transactionId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.transactionId.eq(transactionId));
    return await findOne(find);
  }

  Future<int> remove(String transactionId) async {
    final Remove remove = remover.where(this.transactionId.eq(transactionId));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Order> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.transactionId.eq(model.transactionId));
    }
    return adapter.remove(remove);
  }
}
