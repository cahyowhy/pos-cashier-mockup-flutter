import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:padi_pos_kasir/model/base_entity.dart';

part 'shift.g.dart';
part 'shift.jorm.dart';

@JsonSerializable(includeIfNull: false)
class Shift extends BaseEntity {
  @PrimaryKey()
  int id;

  @Column(isNullable: true)
  double actualBalance = 0;

  @Column(isNullable: true)
  double systemBalance = 0;

  @Column(isNullable: true)
  double differenceBalance = 0;

  @Column(isNullable: true)
  double beginningBalance = 0;

  @Column(isNullable: true)
  double cashCredit = 0;

  @Column(isNullable: true)
  double cashDebit = 0;

  @Column(isNullable: true)
  double cashOther = 0;

  @Column(isNullable: true)
  double cashSales = 0;

  @Column(isNullable: true)
  double cashback = 0;

  @Column(isNullable: true)
  int closeId = 0;

  @Column(isNullable: true)
  String closedBy = "";

  @Column(isNullable: true)
  String openBy = "";

  @Column(isNullable: true)
  String startingTime = "";

  @Column(isNullable: true)
  String closingTime = "";

  @Column(isNullable: true)
  int merchantId = 0;

  @Column(isNullable: true)
  String merchantName = "";

  @Column(isNullable: true)
  int outletId = 0;

  @Column(isNullable: true)
  String outletName = "";

  @Column(isNullable: true)
  int endDate = 0;

  @Column(isNullable: true)
  int startDate = 0;

  @Column(isNullable: true)
  int openId = 0;

  @Column(isNullable: true)
  int reject = 0;

  @Column(isNullable: true)
  int cancel = 0;

  @Column(isNullable: true)
  int sales = 0;

  @PrimaryKey()
  @JsonKey(ignore: true)
  String uniqShiftId = "";

  @JsonKey(ignore: true)
  @Column(isNullable: true)
  String deviceId = "";

  @JsonKey(ignore: true)
  @Column(isNullable: true)
  bool synchronize = false;

  static serializeAsZeroIfNull(dynamic param) => param == null ?? 0;
}

@GenBean()
class ShiftBean extends Bean<Shift> with _ShiftBean {
  ShiftBean(Adapter adapter) : super(adapter);

  final String tableName = 'shifts';

  Future<dynamic> insert(Shift model,
      {bool cascade = false, bool onlyNonNull = false, Set<String> only}) {
    if ((model.uniqShiftId ?? "").isNotEmpty) {
      return super.update(model,
          cascade: cascade, onlyNonNull: onlyNonNull, only: only);
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
