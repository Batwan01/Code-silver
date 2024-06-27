import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_sliver/src/common/util/time/time_util.dart';
import 'package:code_sliver/src/model/enum/capacity_type_enum.dart';
import 'package:code_sliver/src/model/enum/currency_type_enum.dart';
import 'package:code_sliver/src/model/enum/due_enum.dart';
import 'package:code_sliver/src/model/enum/gender_enum.dart';
import 'package:code_sliver/src/model/enum/job_enum.dart';
import 'package:code_sliver/src/model/enum/pay_type_enum.dart';
import 'package:code_sliver/src/model/enum/recruiting_status_enum.dart';
import 'package:code_sliver/src/model/enum/than_type_enum.dart';
import 'package:code_sliver/src/model/vo/common/json_class.dart';

class RecruitingModel implements JsonClass {
  final String id;
  final String uid;
  String imgUrl;
  final JobEnum job;
  final int age;
  final ThanTypeEnum thanType;
  final GenderEnum gender;
  final DueEnum due;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> workWeekDayList;
  final DateTime? startDate;
  final DateTime? endDate;
  final PayTypeEnum payType;
  final int payAmount;
  final CurrencyTypeEnum currencyType;
  final String address;
  final List<CapacityTypeEnum> capacityTypeList;
  final String memo;
  final RecruitingStatusEnum recruitingStatus;

  RecruitingModel({
    required this.id,
    required this.uid,
    required this.imgUrl,
    required this.job,
    required this.age,
    required this.thanType,
    required this.gender,
    required this.due,
    required this.startTime,
    required this.endTime,
    required this.workWeekDayList,
    required this.startDate,
    required this.endDate,
    required this.payType,
    required this.payAmount,
    required this.currencyType,
    required this.address,
    required this.capacityTypeList,
    required this.memo,
    required this.recruitingStatus,
  });

  factory RecruitingModel.fromDocument(DocumentSnapshot doc) {
    List<dynamic> capacityTypeRawList = doc.get("capacityTypeList");
    List<dynamic> workWeekDayRawList = doc.get("workWeekDayList");

    List<CapacityTypeEnum> capacityTypeList = [];
    List<String> workWeekDayList = [];

    for (dynamic e in capacityTypeRawList) {
      String str = e.toString();
      capacityTypeList.add(CapacityTypeEnum.values.byName(str));
    }

    for (dynamic e in workWeekDayRawList) {
      String str = e.toString();
      workWeekDayList.add(str);
    }

    log(doc.get("startDate"));

    RecruitingModel recruitingModel = RecruitingModel(
      id: doc.id,
      uid: doc.get("uid"),
      imgUrl: doc.get("imgUrl"),
      job: JobEnum.values.byName(doc.get("job")),
      age: doc.get("age"),
      thanType: ThanTypeEnum.values.byName(doc.get("thanType")) ,
      gender: GenderEnum.values.byName(doc.get("gender")),
      due: DueEnum.values.byName(doc.get("due")),
      startTime: DateTime.parse(doc.get("startTime")),
      endTime: DateTime.parse(doc.get("endTime")),
      workWeekDayList: workWeekDayList,
      startDate: doc.get("startDate") =='' ? null : DateTime.parse(doc.get("startDate")),
      endDate: doc.get("endDate") =='' ? null :  DateTime.parse(doc.get("endDate")),
      payType: PayTypeEnum.values.byName(doc.get("payType")),
      payAmount: doc.get("payAmount"),
      currencyType: CurrencyTypeEnum.values.byName(doc.get('currencyType')),
      address: doc.get("address"),
      capacityTypeList: capacityTypeList,
      memo: doc.get("memo"),
      recruitingStatus: RecruitingStatusEnum.values.byName(doc.get('recruitingStatus'))
    );

    return recruitingModel;
  }

  @override
  Map<String, dynamic> toJson() {
    List<String> capacityTypeStrList = [];

    for (CapacityTypeEnum capacityTypeEnum in capacityTypeList) {
      capacityTypeStrList.add(capacityTypeEnum.name);
    }

    Map<String, dynamic> jsonMap = {
      "uid": uid,
      "imgUrl": imgUrl,
      "job": job.name,
      "age": age,
      "thanType": thanType.name,
      "gender": gender.name,
      "due": due.name,
      "startTime": TimeUtil.convertYYYYMMDDTimeStr(dateTime: startTime),
      "endTime": TimeUtil.convertYYYYMMDDTimeStr(dateTime: endTime),
      "workWeekDayList": workWeekDayList,
      "startDate": TimeUtil.convertYYYYMMDDStr(dateTime: startDate),
      "endDate": TimeUtil.convertYYYYMMDDStr(dateTime: endDate),
      "payType": payType.name,
      "payAmount": payAmount,
      "currencyType":currencyType.name,
      "address": address,
      "capacityTypeList": capacityTypeStrList,
      "memo": memo,
      "recruitingStatus":recruitingStatus.name
    };
    return jsonMap;
  }
}
