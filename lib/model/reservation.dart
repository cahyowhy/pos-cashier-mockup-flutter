import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:padi_pos_kasir/model/base_entity.dart';

part 'reservation.g.dart';
part 'reservation.jorm.dart';

@JsonSerializable(includeIfNull: false)
class Reservation extends BaseEntity {
  Reservation();

  @PrimaryKey()
  int id;

  String name = "";

  int pax = 0;

  int startTime = 0;

  int endTime = 0;

  @IgnoreColumn()
  @JsonKey(ignore: true)
  int placeId;

  @IgnoreColumn()
  @JsonKey(ignore: true)
  bool isComing;

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return _$ReservationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    var json = _$ReservationToJson(this);

    BaseEntity.deleteEmptyVal(json, [
      "id",
      "name",
      "startTime",
      "endTime",
    ]);

    return json;
  }

//   @autoserializeAs(RealmList(PlaceWrapper, true))
//   @schemaProperty({type: "string" /** Fake array json from string */})
//   public places: Array<PlaceWrapper> = [];

//   @autoserializeAs(RealmList(null, true))
//   @schemaProperty({type: "string" /** Fake array json from string */})
//   public placeIds: Array<string> = [];
}

@GenBean()
class ReservationBean extends Bean<Reservation> with _ReservationBean {
  ReservationBean(Adapter adapter) : super(adapter);

  final String tableName = 'reservations';

  Future<dynamic> insert(Reservation model,
      {bool cascade = false, bool onlyNonNull = false, Set<String> only}) {
    if ((model.id ?? 0) != 0) {
      return super.update(model,
          cascade: cascade, onlyNonNull: onlyNonNull, only: only);
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
