import 'package:flutter/material.dart';
import 'package:taskmanager/common/utils/date_time_util.dart';
import 'package:taskmanager/screens/task_manager/models/task_manager_model.dart';

class TaskManagerProvider with ChangeNotifier {
  TaskManagerModel? _taskManagerModel;
  TaskManagerModel? get taskManagerModel => _taskManagerModel;
  set taskManagerModel(TaskManagerModel? newValue) {
    _taskManagerModel = newValue;
    notifyListeners();
  }

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController get textEditingController => _textEditingController;
  set textEditingController(TextEditingController newValue) {
    _textEditingController = newValue;
    notifyListeners();
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? newValue) {
    _startDate = newValue;
    notifyListeners();
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? newValue) {
    _endDate = newValue;
    notifyListeners();
  }

  TimeOfDay? _startTime;
  TimeOfDay? get startTime => _startTime;
  set startTime(TimeOfDay? newValue) {
    _startTime = newValue;
    notifyListeners();
  }

  TimeOfDay? _endTime;
  TimeOfDay? get endTime => _endTime;
  set endTime(TimeOfDay? newValue) {
    _endTime = newValue;
    notifyListeners();
  }

  String setDateTime(
    bool isStart, {
    DateTime? date,
    TimeOfDay? time,
  }) {
    String _date = DateTimeUtils.dateFormat(date, format: 'EEEE, dd MMMM yyy');
    if (date != null && time != null) {
      return '$_date Jam ${time.hour}:${time.minute}';
    } else {
      if (isStart) {
        return 'Tanggal Penugasan';
      }
      return 'Batas Waktu';
    }
  }
}
