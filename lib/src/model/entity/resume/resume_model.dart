import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_sliver/src/common/util/time/time_util.dart';
import 'package:code_sliver/src/model/enum/advantage_point_enum.dart';
import 'package:code_sliver/src/model/enum/gender_enum.dart';
import 'package:code_sliver/src/model/enum/job_enum.dart';
import 'package:code_sliver/src/model/enum/than_type_enum.dart';
import 'package:code_sliver/src/model/vo/common/json_class.dart';

class ResumeModel implements JsonClass {
  final String id;
  final String uid;
  final String imgUrl;
  final JobEnum job;
  final int age;
  final ThanTypeEnum thanType;
  final String name;
  final GenderEnum gender;
  final List<String> workWeekDayList;
  final String academicAbility;
  final String career;
  final List<AdvantagePointEnum> advantagePointList;
  final String introduce;
  final DateTime startTime;
  final DateTime endTime;


  ResumeModel({
    required this.id,
    required this.uid,
    required this.imgUrl,
    required this.job,
    required this.age,
    required this.thanType,
    required this.name,
    required this.gender,
    required this.workWeekDayList,
    required this.academicAbility,
    required this.career,
    required this.advantagePointList,
    required this.introduce,
    required this.startTime,
    required this.endTime,
  });

  factory ResumeModel.fromDocument(DocumentSnapshot doc) {
    List<dynamic> advantagePointRawList = doc.get("advantagePointList");
    List<dynamic> workWeekDayRawList = doc.get("workWeekDayList");

    List<AdvantagePointEnum> advantagePointEnumList = [];
    List<String> workWeekDayList = [];

    for (dynamic e in advantagePointRawList) {
      String str = e.toString();
      advantagePointEnumList.add(AdvantagePointEnum.values.byName(str));
    }

    for (dynamic e in workWeekDayRawList) {
      String str = e.toString();
      workWeekDayList.add(str);
    }

    return ResumeModel(
      id: doc.id,
      uid: doc.get("uid"),
      imgUrl: doc.get("imgUrl"),
      job: JobEnum.values.byName(doc.get("job")),
      age: doc.get("age"),
      thanType: ThanTypeEnum.values.byName(doc.get('thanType')),
      name: doc.get("name"),
      gender: GenderEnum.values.byName(doc.get("gender"),),
      workWeekDayList: workWeekDayList,
      academicAbility: doc.get("academicAbility"),
      career: doc.get("career"),
      advantagePointList: advantagePointEnumList,
      introduce: doc.get("introduce"),
      startTime: DateTime.parse(doc.get("startTime")),
      endTime: DateTime.parse(doc.get("endTime")),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    List<String> advantagePointListStr = [];
    for (AdvantagePointEnum advantagePointEnum in advantagePointList) {
      advantagePointListStr.add(advantagePointEnum.name);
    }
    Map<String, dynamic> jsonMap = {
      "uid": uid,
      "imgUrl": imgUrl,
      "job": job.name,
      "age": age,
      "thanType": thanType.name,
      "gender": gender.name,
      "name": name,
      "workWeekDayList": workWeekDayList,
      "academicAbility": academicAbility,
      "career": career,
      "advantagePointList": advantagePointListStr,
      "introduce": introduce,
      "startTime": TimeUtil.convertYYYYMMDDTimeStr(dateTime: startTime),
      "endTime": TimeUtil.convertYYYYMMDDTimeStr(dateTime: endTime),
    };
    return jsonMap;
  }
}

