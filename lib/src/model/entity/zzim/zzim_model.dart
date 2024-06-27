import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_sliver/src/model/enum/zzim_type_enum.dart';
import 'package:code_sliver/src/model/vo/common/json_class.dart';

class ZzimModel implements JsonClass {
  final String id;
  final String uid;
  final String zzimId;
  final ZzimTypeEnum zzimType;

  ZzimModel({
    required this.id,
    required this.uid,
    required this.zzimId,
    required this.zzimType,
  });

  factory ZzimModel.fromDocument(DocumentSnapshot doc) {
    return ZzimModel(id: doc.id, uid: doc.get("uid"), zzimId: doc.get("zzimId"), zzimType: ZzimTypeEnum.values.byName(doc.get("zzimType")));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "zzimId": zzimId,
      "zzimType": zzimType.name,
    };
  }
}
