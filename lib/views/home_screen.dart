import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/main.dart';

import '../controllers/textField_controller.dart';
import 'addTask_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.changeStatusColor(
        Theme.of(context).colorScheme.primary, Brightness.light);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<TaskController>().isEditMode = false;
          Get.find<TextFiledController>().titleController!.text = "";
          Get.find<TextFiledController>().noteController!.text = "";
          Get.toNamed("/addTask")!.then((value) => MyApp.changeStatusColor(
              Theme.of(context).colorScheme.primary, Brightness.light));
        },
        shape: const CircleBorder(),
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: Get.width,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8, 0, 0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.task,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 36, top: 16),
                    child: Text(
                      "All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36, top: 5),
                    child: Obx(() {
                      return Text(
                        "${Get.find<TaskController>().tasks.length} tasks",
                        style: const TextStyle(color: Colors.white),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.6,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18),
                  topLeft: Radius.circular(18),
                ),
              ),
              child: Obx(() {
                return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onLongPress: () {
                          Get.find<TaskController>().removeTask(index);
                        },
                        onTap: () {
                          Get.find<TaskController>().isEditMode = true;
                          Get.find<TaskController>().indexEdit = index;
                          Get.find<TextFiledController>()
                                  .titleController!
                                  .text =
                              Get.find<TaskController>().tasks[index].title;
                          Get.find<TextFiledController>().noteController!.text =
                              Get.find<TaskController>().tasks[index].note;
                          Get.toNamed("/addTask");
                        },
                        title:
                            Text(Get.find<TaskController>().tasks[index].title),
                        subtitle:
                            Text(Get.find<TaskController>().tasks[index].note),
                        trailing: Checkbox(
                          activeColor: Theme.of(context).colorScheme.primary,
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          onChanged: (bool? value) {
                            var task = Get.find<TaskController>().tasks[index];
                            task.status = !task.status;
                            Get.find<TaskController>().tasks[index] = task;
                          },
                          value: Get.find<TaskController>().tasks[index].status,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.black.withOpacity(0.1),
                        height: 1,
                      );
                    },
                    itemCount: Get.find<TaskController>().tasks.length);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
