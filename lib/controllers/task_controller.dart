import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_app/models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  var isEditMode = false;
  var indexEdit = 0;

  void addTask(TaskModel task) {
    tasks.add(task);
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  @override
  void onInit() {
    var box = GetStorage();
    if (box.read('tasks') != null) {
      var list = box.read('tasks');
      for (var item in list) {
        tasks.add(TaskModel.fromJson(item));
      }
    }

    ever(
      tasks,
      (callback) {
        box.write('tasks', tasks.toJson());
      },
    );
    super.onInit();
  }
}
