import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_sliver/src/common/util/time/time_util.dart';
import 'package:code_sliver/src/model/vo/common/json_class.dart';

class UserModel implements JsonClass {
  final String uid;
  final String imgUrl;
  final String name;
  final String introduce;
  final List<DateTime> noWorkDayList;
  final bool policeClearanceFlag;
  final String fcmToken;
  final String userRole;

  UserModel({
    required this.uid,
    required this.imgUrl,
    required this.name,
    required this.introduce,
    required this.noWorkDayList,
    required this.policeClearanceFlag,
    required this.fcmToken,
    required this.userRole,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    List<dynamic> noWorkRawList = doc.get("noWorkDayList");
    List<DateTime> noWorkDayList = [];

    for(dynamic e in noWorkRawList){
      String str = e.toString();
      DateTime dateTime = DateTime.parse(str);
      noWorkDayList.add(dateTime);
    }

    return UserModel(
      uid:  doc.get("uid"),
      imgUrl:  doc.get("imgUrl"),
      name:  doc.get("name"),
      introduce: doc.get("introduce"),
      noWorkDayList:  noWorkDayList,
      policeClearanceFlag:  doc.get("policeClearanceFlag"),
      fcmToken: doc.get("fcmToken"),
      userRole: doc.get("userRole"),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    List<String> dayStrList = [];

    for (DateTime dateTime in noWorkDayList) {
      dayStrList.add(TimeUtil.convertYYYYMMDDEStr(dateTime: dateTime));
    }

    return {
      "uid": uid,
      "imgUrl": imgUrl,
      "name": name,
      "introduce": introduce,
      "noWorkDayList": dayStrList,
      "policeClearanceFlag": policeClearanceFlag,
      "fcmToken": fcmToken,
      "userRole":userRole
    };
  }
}
