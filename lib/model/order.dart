import 'dart:convert';

/**
 * Created by Cahyo on 2019-09-03 12:48:57.
 **/

import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:padi_pos_kasir/config/constant.dart';
import 'package:padi_pos_kasir/model/base_entity.dart';
import 'package:padi_pos_kasir/model/payment_type.dart';
import 'package:padi_pos_kasir/model/product.dart';
import 'package:padi_pos_kasir/model/reservation.dart';
import 'package:padi_pos_kasir/model/service_type.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';

part 'order.g.dart';
part 'order.jorm.dart';

@JsonSerializable(includeIfNull: false)
class Order extends BaseEntity {
  Order({this.total});

  @IgnoreColumn()
  @JsonKey(ignore: true)
  Product product = Product();

  @IgnoreColumn()
  @JsonKey(ignore: true)
  int total = 0;

  @PrimaryKey()
  String transactionId = "";

  @Column(isNullable: true)
  int orderId = 0;

  @Column(isNullable: true)
  int serviceCharge = 0;

  @Column(isNullable: true)
  int promoDiscount = 0;

  @Column(isNullable: true)
  int salesDiscount = 0;

  @Column(isNullable: true)
  int shiftId = 0;

  @Column(isNullable: true)
  int createdId = 0;

  @Column(isNullable: true)
  int placeId = 0;

  @Column(isNullable: true)
  double subTotal = 0;

  @Column(isNullable: true)
  double cash = 0;

  @Column(isNullable: true)
  double change = 0;

  @Column(isNullable: true)
  double ppn = 0;

  @Column(isNullable: true)
  double grandTotal = 0;

  @Column(isNullable: true)
  int transactionTime = 0;

  //orderDetails

  @Column(isNullable: true)
  int paymentTypeId = 0;

  @JsonKey(ignore: true)
  String paymentTypeJson = "";

  @IgnoreColumn()
  @JsonKey(ignore: true)
  PaymentType paymentType = PaymentType(type: Constant.PAYMENT_CASH);

  @Column(isNullable: true)
  int serviceTypeId = 0;

  @Column(isNullable: true)
  @JsonKey(ignore: true)
  String serviceTypeJson = "";

  @IgnoreColumn()
  @JsonKey(ignore: true)
  ServiceType serviceType = ServiceType();

  @Column(isNullable: true)
  int reservationId = 0;

  @Column(isNullable: true)
  String reservationName = "";

  @JsonKey(ignore: true)
  String reservationJson = "";

  @IgnoreColumn()
  @JsonKey(ignore: true)
  Reservation reservation = Reservation();

  @Column(isNullable: true)
  String customerName = "";

  @Column(isNullable: true)
  String uniqShiftId = "";

  @Column(isNullable: true)
  String placeName = "";

  @Column(isNullable: true)
  String clientId = "";

  @Column(isNullable: true)
  @JsonKey(ignore: true)
  String senderId = "";

  @Column(isNullable: true)
  @JsonKey(ignore: true)
  String serveBy = "";

  @Column(isNullable: true)
  @JsonKey(ignore: true)
  bool synchronize = false;

  @Column(isNullable: true)
  @JsonKey(ignore: true)
  bool isReservation = false;

  @Column(isNullable: true)
  @JsonKey(ignore: true)
  bool isAllFinish = false;

  @IgnoreColumn()
  @JsonKey(ignore: true)
  bool childNotFinish = false;

  @IgnoreColumn()
  @JsonKey(ignore: true)
  bool isEdit = false;

  @IgnoreColumn()
  @JsonKey(ignore: true)
  List<int> rangeDate = [];

  //   @autoserializeAs(RealmList(OrderDetail))
  //   @schemaProperty({type: "list", objectType: "OrderDetail"})
  //   public orderDetails: Array<OrderDetail> = [];

  factory Order.fromJson(Map<String, dynamic> json) {
    BaseEntity.deserializeDate(json, ["transactionTime"]);
    Order order = _$OrderFromJson(json);

    if (json["paymentType"] is Map && json["paymentType"] != null) {
      order.paymentType = PaymentType.fromJson(json["paymentType"]);
    }

    if (json["serviceType"] is Map && json["serviceType"] != null) {
      order.serviceType = ServiceType.fromJson(json["serviceType"]);
    }

    if (json["reservation"] is Map && json["reservation"] != null) {
      order.reservation = Reservation.fromJson(json["reservation"]);
    }

    return order;
  }

  Map<String, dynamic> toJson() {
    var json = _$OrderToJson(this);

    if ((this.paymentType.id ?? 0) != 0) {
      json["paymentTypeId"] = this.paymentType.id;
    }

    if ((this.serviceType.id ?? 0) != 0) {
      json["serviceTypeId"] = this.serviceType.id;
    }

    if ((this.serviceType.id ?? 0) != 0) {
      json["serviceTypeId"] = this.serviceType.id;
    }

    if ((this.reservation.id ?? 0) != 0) {
      json["reservationId"] = this.reservation.id;
      json["reservationName"] = this.reservation.name;
    }

    BaseEntity.deleteEmptyVal(json, [
      "orderId",
      "createdId",
      "transactionId",
      "transactionTime",
      "customerName",
      "placeName",
      "placeId",
      "reservationName",
      "reservationId",
      "paymentTypeId",
      "serviceTypeId",
      "shiftId",
      "uniqShiftId",
      "note",
      "clientId",
      "senderId",
      "serveBy"
    ]);

    BaseEntity.serializedDate(json, ["transactionTime"]);

    return json;
  }

  Map<String, String> toMap() {
    return {"product": product.name, "total": total.toString()};
  }
}

@GenBean()
class OrderBean extends Bean<Order> with _OrderBean {
  OrderBean(Adapter adapter) : super(adapter);

  final String tableName = 'orders';

  Future<dynamic> insert(Order model,
      {bool cascade = false, bool onlyNonNull = false, Set<String> only}) {
    try {
      if ((model.reservation.id ?? 0) != 0) {
        model.reservationJson = json.encode(model.reservation.toJson());
      }

      if ((model.paymentType.id ?? 0) != 0) {
        model.paymentTypeJson = json.encode(model.paymentType.toJson());
      }

      if ((model.serviceType.id ?? 0) != 0) {
        model.serviceTypeJson = json.encode(model.serviceType.toJson());
      }
    } catch (e) {
      print(e.toString());
    }

    if ((model.transactionId ?? "").isNotEmpty) {
      return super.update(model,
          cascade: cascade, onlyNonNull: onlyNonNull, only: only);
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
