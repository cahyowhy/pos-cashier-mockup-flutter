import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:padi_pos_kasir/model/base_entity.dart';

part 'service_type.g.dart';
part 'service_type.jorm.dart';

@JsonSerializable(includeIfNull: false)
class ServiceType extends BaseEntity {
  ServiceType({this.serviceName, this.type});

  @PrimaryKey()
  int id;

  @Column(isNullable: true)
  String serviceName = "";

  @Column(isNullable: true)
  String type = "";

  @Column(isNullable: true)
  @JsonKey(ignore: true)
  String color = "";

  @Column(isNullable: true)
  @JsonKey(ignore: true)
  double charges = 0;

  @Column(isNullable: true)
  bool deleted = false;

  @IgnoreColumn()
  @JsonKey(ignore: true)
  bool isSelected = false;

  factory ServiceType.fromJson(Map<String, dynamic> json) {
    return _$ServiceTypeFromJson(json);
  }

  Map<String, dynamic> toJson() {
    var json = _$ServiceTypeToJson(this);

    BaseEntity.deleteEmptyVal(json, [
      "id",
      "serviceName",
      "type",
    ]);
  }
}

@GenBean()
class ServiceTypeBean extends Bean<ServiceType> with _ServiceTypeBean {
  ServiceTypeBean(Adapter adapter) : super(adapter);

  final String tableName = 'service_types';

  Future<dynamic> insert(ServiceType model,
      {bool cascade = false, bool onlyNonNull = false, Set<String> only}) {
    if ((model.id ?? 0) != 0) {
      return super.update(model,
          cascade: cascade, onlyNonNull: onlyNonNull, only: only);
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
