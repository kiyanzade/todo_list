import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/models/task_model.dart';

import '../controllers/textField_controller.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.changeStatusColor(Colors.white, Brightness.dark);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(
                      Get.find<TaskController>().isEditMode
                          ? "Edit Task"
                          : "New Task",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 16),
              child: Text(
                "What are you planning?",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextField(
                controller: Get.find<TextFiledController>().titleController,
                autofocus: true,
                maxLines: 6,
                cursorHeight: 42,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400))),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: Get.find<TextFiledController>().noteController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.bookmark_add,
                    color: Colors.grey,
                  ),
                  hintText: "add note"),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              width: Get.width,
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary)),
                onPressed: () {
                  if (Get.find<TaskController>().isEditMode) {
                    var task = Get.find<TaskController>()
                        .tasks[Get.find<TaskController>().indexEdit];

                    task.title =
                        Get.find<TextFiledController>().titleController!.text;

                    task.note =
                        Get.find<TextFiledController>().noteController!.text;

                    Get.find<TaskController>()
                        .tasks[Get.find<TaskController>().indexEdit] = task;
                  } else {
                    Get.find<TaskController>().addTask(TaskModel(
                        Get.find<TextFiledController>().titleController!.text,
                        Get.find<TextFiledController>().noteController!.text,
                        false));
                  }

                  Get.back();
                },
                child: Text(
                    Get.find<TaskController>().isEditMode ? "Edit" : "Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
