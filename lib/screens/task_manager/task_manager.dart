import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/common/Widgets/app_widget.dart';
import 'package:taskmanager/screens/task_manager/models/task_manager_model.dart';
import 'package:taskmanager/screens/task_manager/providers/task_manager_provider.dart';
import 'package:taskmanager/screens/task_manager/widgets/task_manager_widget.dart';

class TaskManagerScreen extends StatelessWidget {
  const TaskManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskManagerProvider(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 100.h,
                  floating: false,
                  pinned: true,
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  flexibleSpace: const FlexibleSpaceBar(
                    titlePadding: EdgeInsets.fromLTRB(56.0, 8.0, 8.0, 12.0),
                    title: Text(
                      "Task Manager",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    background: Image(
                      image: AssetImage(
                        'assets/images/task_manager.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200]!,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    child: ListTile(
                      leading: const Icon(
                        Icons.edit,
                      ),
                      title: Consumer<TaskManagerProvider>(
                        builder: (_, taskManagerProvider, __) {
                          return TextFormField(
                            controller:
                                taskManagerProvider.textEditingController,
                            decoration: InputDecoration(
                              hintText: 'Judul Tugas',
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              fillColor: Colors.white,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200]!,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Consumer<TaskManagerProvider>(
                          builder: (_, taskManagerProvider, __) {
                            return ListTile(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                TaskManagerWidget.dateTimePicker(
                                  context: context,
                                  isStart: true,
                                  taskManagerProvider: taskManagerProvider,
                                );
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              leading: const Icon(
                                Icons.event,
                              ),
                              title: Text(
                                taskManagerProvider.setDateTime(
                                  true,
                                  date: taskManagerProvider.startDate,
                                  time: taskManagerProvider.startTime,
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          height: 1,
                          width: 1.sw - 32,
                          color: Colors.grey[400],
                        ),
                        Consumer<TaskManagerProvider>(
                          builder: (_, taskManagerProvider, __) {
                            return ListTile(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                TaskManagerWidget.dateTimePicker(
                                  context: context,
                                  isStart: false,
                                  taskManagerProvider: taskManagerProvider,
                                );
                              },
                              leading: const Icon(
                                Icons.event,
                              ),
                              title: Text(
                                taskManagerProvider.setDateTime(
                                  false,
                                  date: taskManagerProvider.endDate,
                                  time: taskManagerProvider.endTime,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Consumer<TaskManagerProvider>(
                  builder: (context, taskManagerProvider, __) {
                    return AppWidget.appButton(
                      height: 40.h,
                      onPressed: () {
                        taskManagerProvider.taskManagerModel = TaskManagerModel(
                          title: taskManagerProvider.textEditingController.text,
                          startDateTime: taskManagerProvider.setDateTime(
                            true,
                            date: taskManagerProvider.endDate,
                            time: taskManagerProvider.endTime,
                          ),
                          endDateTime: taskManagerProvider.setDateTime(
                            false,
                            date: taskManagerProvider.endDate,
                            time: taskManagerProvider.endTime,
                          ),
                        );
                      },
                      buttonText: 'Simpan Tugas',
                      buttonTextStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                Consumer<TaskManagerProvider>(
                  builder: (context, taskManagerProvider, __) {
                    if (taskManagerProvider.taskManagerModel == null) {
                      return Container();
                    }
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200]!,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tugas',
                            style: TextStyle(fontSize: 24.0),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Judul',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            taskManagerProvider.taskManagerModel!.title,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Tanggal Penugasan',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            taskManagerProvider.taskManagerModel!.startDateTime,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Batas Waktu',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            taskManagerProvider.taskManagerModel!.endDateTime,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
