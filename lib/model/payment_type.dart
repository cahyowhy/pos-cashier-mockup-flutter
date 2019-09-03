import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:padi_pos_kasir/model/base_entity.dart';

part 'payment_type.g.dart';
part 'payment_type.jorm.dart';

@JsonSerializable(includeIfNull: false)
class PaymentType extends BaseEntity {
  PaymentType({this.type});

  @JsonKey()
  @PrimaryKey()
  int id;

  String type = "";

  String accountName = "";

  String accountNumber = "";

  String validityPeriodMonth = "";

  String validityPeriodYear = "";

  bool deleted = false;

  @JsonKey(ignore: true)
  String grouper = "";

  @JsonKey(ignore: true)
  String icon = "";

  @IgnoreColumn()
  @JsonKey(ignore: true)
  bool isSelected = false;

  factory PaymentType.fromJson(Map<String, dynamic> json) {
    return _$PaymentTypeFromJson(json);
  }

  Map<String, dynamic> toJson() {
    var json = _$PaymentTypeToJson(this);

    BaseEntity.deleteEmptyVal(json, [
      "id",
      "type",
      "accountName",
      "accountNumber",
      "validityPeriodMonth",
      "validityPeriodYear",
      "grouper",
      "icon"
    ]);

    return json;
  }
}

@GenBean()
class PaymentTypeBean extends Bean<PaymentType> with _PaymentTypeBean {
  PaymentTypeBean(Adapter adapter) : super(adapter);

  final String tableName = 'payment_types';

  Future<dynamic> insert(PaymentType model,
      {bool cascade = false, bool onlyNonNull = false, Set<String> only}) {
    if ((model.id ?? 0) != 0) {
      return super.update(model,
          cascade: cascade, onlyNonNull: onlyNonNull, only: only);
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
