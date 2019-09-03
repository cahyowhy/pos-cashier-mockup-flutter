import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:padi_pos_kasir/model/base_entity.dart';

part 'shift.g.dart';
part 'shift.jorm.dart';

@JsonSerializable(includeIfNull: false)
class Shift extends BaseEntity {
  @PrimaryKey()
  int id;

  double actualBalance = 0;

  double systemBalance = 0;

  double differenceBalance = 0;

  double beginningBalance = 0;

  double cashCredit = 0;

  double cashDebit = 0;

  double cashOther = 0;

  double cashSales = 0;

  double cashback = 0;

  int closeId = 0;

  String closedBy = "";

  String openBy = "";

  String startingTime = "";

  String closingTime = "";

  int merchantId = 0;

  String merchantName = "";

  int outletId = 0;

  String outletName = "";

  int endDate = 0;

  int startDate = 0;

  int openId = 0;

  int reject = 0;

  int cancel = 0;

  int sales = 0;

  @PrimaryKey()
  @JsonKey(ignore: true)
  String uniqShiftId = "";

  @JsonKey(ignore: true)
  String deviceId = "";

  @JsonKey(ignore: true)
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
