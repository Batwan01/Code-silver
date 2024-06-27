
import 'package:code_sliver/src/model/vo/common/json_class.dart';

class ChatRoomVo implements JsonClass{
  final String chatRoomId;
  final String idFrom;
  final String idTo;
  final String content;
  final String timestamp;
  final String type;

  ChatRoomVo({
    required this.chatRoomId,
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "chatRoomId": chatRoomId,
      "idFrom": idFrom,
      "idTo": idTo,
      "timestamp": timestamp,
      "content": content,
      "type": type,
    };
  }
}