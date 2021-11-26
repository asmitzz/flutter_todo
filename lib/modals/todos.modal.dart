class TodosModal {
  String title = "";
  DateTime completedBy = DateTime.now();
  bool isComplete = false;
  bool saveAsAlarm = false;
  bool saveAsNotifications = false;

  TodosModal({required this.title, required this.completedBy, required this.isComplete, required this.saveAsAlarm,
 required this.saveAsNotifications});
}
