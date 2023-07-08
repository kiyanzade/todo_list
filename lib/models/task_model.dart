class TaskModel {
  String title;
  String note;
  bool status;

  TaskModel(this.title, this.note, this.status);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'note': note,
      'status': status,
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        note = json['note'],
        status = json['status'];
}
