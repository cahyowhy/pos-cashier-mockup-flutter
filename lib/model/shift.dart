// @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public actualBalance: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public systemBalance: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public differenceBalance: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public beginningBalance: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public cashCredit: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public cashDebit: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public cashOther: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public cashSales: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "double"})
//   public cashback: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public closeId: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "string"})
//   public closedBy: string = "";

//   @deserialize
//   @serialize
//   @schemaProperty({type: "string"})
//   public closingTime: string = "";

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public endDate: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public openId: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "string"})
//   public openBy: string = "";

//   @deserialize
//   @serialize
//   @schemaProperty({type: "string"})
//   public startingTime: string = "";

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public startDate: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public merchantId: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "string"})
//   public merchantName: string = "";

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public outletId: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "string"})
//   public outletName: string = "";

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public reject: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public cancel: number = 0;

//   @deserialize
//   @serialize
//   @schemaProperty({type: "int"})
//   public sales: number = 0;

//   /** For local only */
//   @deserialize
//   @schemaProperty({type: "string"})
//   public uniqShiftId: string = "";

//   @deserialize
//   @schemaProperty({type: "string"})
//   public deviceId: string = "";       // marker for indicate shift is open from this device (for Current Shift)

//   @autoserializeAs(RealmList(Order))
//   public orders: Array<Order> = [];   // containing list of order not synchronized

//   @autoserializeAs(RealmList(CashActivity, true))
//   @schemaProperty({type: "string" /** Fake array json from string */})
//   public cashTransactions: Array<CashActivity> = [];   // containing list of cash activity

//   @autoserializeAs(RealmList(Order, true))
//   @schemaProperty({type: "string" /** Fake array json from string */})
//   public shiftOrders: Array<Order> = [];

//   @deserialize
//   @schemaProperty({type: "bool"})
//   public synchronize: boolean | string = false; // flag for has been save to API

import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(includeIfNull: false)
class Shift {
  @PrimaryKey()
  int id;

  @Column()
  @JsonKey()
  double actualBalance = 0;

  @Column()
  @JsonKey()
  double systemBalance = 0;

  @Column()
  @JsonKey()
  double differenceBalance = 0;

  @Column()
  @JsonKey()
  double beginningBalance = 0;

  @Column()
  @JsonKey()
  double cashCredit = 0;

  @Column()
  @JsonKey()
  double cashDebit = 0;

  @Column()
  @JsonKey()
  double cashOther = 0;

  @Column()
  @JsonKey()
  double cashSales = 0;

  @Column()
  @JsonKey()
  double cashback = 0;

  @Column()
  int closeId;

  @Column()
  String closedBy;

  @Column()
  String openBy;

  @Column()
  String startingTime;

  @Column()
  String closingTime;

  @Column()
  int merchantId;

  @Column()
  String merchantName;

  @Column()
  int outletId;

  @Column()
  String outletName;

  @Column()
  int endDate;

  @Column()
  int startDate;

  @Column()
  int openId;

  @Column()
  @JsonKey()
  int reject = 0;

  @Column()
  @JsonKey()
  int cancel = 0;

  @Column()
  @JsonKey()
  int sales = 0;

  @Column()
  @JsonKey(ignore: true)
  String uniqShiftId = "";

  @Column()
  String deviceId;

  @Column(isNullable: true)
  bool synchronize = false;

  static serializeAsZeroIfNull(dynamic param) => param == null ?? 0;
}
