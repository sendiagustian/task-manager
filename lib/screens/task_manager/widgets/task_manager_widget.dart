import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskmanager/screens/task_manager/providers/task_manager_provider.dart';

class TaskManagerWidget {
  static Future dateTimePicker({
    required BuildContext context,
    required bool isStart,
    required TaskManagerProvider taskManagerProvider,
  }) async {
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    selectedDate = await showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 1.sw * 75 / 100,
                  height: 1.sh * 75 / 100,
                  constraints: const BoxConstraints(
                    minWidth: 360,
                    minHeight: 560,
                  ),
                  child: DatePickerDialog(
                    initialDate: DateTime.now(),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    firstDate: DateTime(2021),
                    lastDate: DateTime.now().add(const Duration(days: 3600)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    if (selectedDate != null) {
      selectedTime = await showDialog<TimeOfDay>(
        context: context,
        useSafeArea: false,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 1.sw * 75 / 100,
                    height: 1.sh * 75 / 100,
                    constraints: const BoxConstraints(
                      minWidth: 360,
                      minHeight: 560,
                    ),
                    child: TimePickerDialog(
                      initialTime: TimeOfDay.now(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
    if (isStart) {
      taskManagerProvider.startDate = selectedDate;
      taskManagerProvider.startTime = selectedTime;
    } else {
      taskManagerProvider.endDate = selectedDate;
      taskManagerProvider.endTime = selectedTime;
    }
  }
}
