import 'package:cloud_firestore/cloud_firestore.dart';

class TodosModal {
  String title = "";
  String id = "";
  DateTime completedBy = DateTime.now();
  bool isComplete = false;
  bool saveAsAlarm = false;
  bool saveAsNotifications = false;

  TodosModal(
      {
        this.id = "",
        required this.title,
      required this.completedBy,
      required this.isComplete,
      required this.saveAsAlarm,
      required this.saveAsNotifications});

  TodosModal.fromJson(QueryDocumentSnapshot json) {
    id = json.id;
    title = json['title'];
    completedBy = json['completedBy'].toDate();
    isComplete = json['isComplete'];
    saveAsAlarm = json['saveAsAlarm'];
    saveAsNotifications = json['saveAsNotifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['completedBy'] = completedBy;
    data['isComplete'] = isComplete;
    data['saveAsAlarm'] = saveAsAlarm;
    data['saveAsNotifications'] = saveAsNotifications;
    return data;
  }
}
