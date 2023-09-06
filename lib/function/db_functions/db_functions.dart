import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workouttraker/model/task_model/workoutmodel1.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:workouttraker/model/task_model/workoutmodel1.dart';
ValueNotifier<List<Workoutmodel>> workoutListNotifier = ValueNotifier([]);

void addTask(Workoutmodel value) async {
  final workoutDB = await Hive.openBox<Workoutmodel>('workout_db');
  final id = await workoutDB.add(value);
  value.id = id;
  workoutListNotifier.value.add(value);
  getAllTasks();

  workoutListNotifier.notifyListeners();
}

// Future<void> getAllTasks() async {
//   final workoutDB = await Hive.openBox<Workoutmodel>('workout_db');
//   workoutListNotifier.value.clear();
//   workoutListNotifier.value.addAll(workoutDB.values);
//   workoutListNotifier.notifyListeners();
// }
Future<void> getAllTasks() async {
  final workoutDB = await Hive.openBox<Workoutmodel>('workout_db');
  final List<Workoutmodel> workoutList = workoutDB.values.toList();
  

  // The key is not needed here, just update 'isChecked'
  workoutList.forEach((workout) {
    final storedWorkout = workoutDB.get(workout.id); // Fetch stored Workoutmodel
    if (storedWorkout != null) {
      workout.isChecked = storedWorkout.isChecked;
    }
  });

  workoutListNotifier.value = workoutList;
  // printAllDates(workoutListNotifier.value);
  workoutListNotifier.notifyListeners();
}
Future<void> deleteTask(int id) async {
  final workoutDB = await Hive.openBox<Workoutmodel>('workout_db');
  await workoutDB.deleteAt(id);
  getAllTasks();
}
// Future<void> updateTask(int id, Workoutmodel value) async {
//   final studentsDB = await Hive.openBox<Workoutmodel>('Workout_db');
//   value.isChecked = studentsDB.getAt(id)!.isChecked;
//   await studentsDB.putAt(id, value);
//   getAllTasks();
// }
Future<void> updateTask(int id, Workoutmodel value) async {
  final workoutDB = await Hive.openBox<Workoutmodel>('workout_db');
  value.isChecked = workoutDB.getAt(id)!.isChecked;
  await workoutDB.putAt(id, value);
   getAllTasks();
  
  final storedWorkout = workoutDB.get(id);
  if (storedWorkout != null) {
    storedWorkout.isChecked = value.isChecked; // Update isChecked property
    // await workoutDB.put(id, storedWorkout);
    
    // Notify listeners after updating the item
    getAllTasks();
  }
}
// -----------------------------------------------------------------------------------------------------------------total day-----------------
int getDayTasksCount() {
  // Get the list of tasks from the notifier
  List<Workoutmodel> tasks = workoutListNotifier.value;

  // Get the current date with time set to midnight
  DateTime currentDate = DateTime.now();
  currentDate = DateTime(currentDate.year, currentDate.month, currentDate.day);

  // Filter tasks where the duration is 'Day' and the date is the current date
  List<Workoutmodel> dayTasks = tasks.where((task) {
    DateTime taskDate = task.date!;
    taskDate = DateTime(taskDate.year, taskDate.month, taskDate.day);
    return task.duration == 'Day' && taskDate.isAtSameMomentAs(currentDate);
  }).toList();

  // Print task name and current date
  for (Workoutmodel task in dayTasks) {
    print('Task date: ${task.date}');
    print('Current Date: $currentDate');
  }

  // Return the count of 'Day' tasks for the current date
  return dayTasks.length;
}
// -----------------------------------------------------------------------------------------------------------------------------completed day-----------------------
int getDayTasksCountCpt() {
  // Get the list of tasks from the notifier
  List<Workoutmodel> tasks = workoutListNotifier.value;

  // Get the current date with time set to midnight
  DateTime currentDate = DateTime.now();
  currentDate = DateTime(currentDate.year, currentDate.month, currentDate.day);

  // Filter tasks where the duration is 'Day', the date is the current date, and isChecked is true
  List<Workoutmodel> dayTasks = tasks.where((task) {
    DateTime taskDate = task.date!;
    taskDate = DateTime(taskDate.year, taskDate.month, taskDate.day);
    return task.duration == 'Day' && taskDate.isAtSameMomentAs(currentDate) && task.isChecked;
  }).toList();

  // Print task date and current date
  for (Workoutmodel task in dayTasks) {
    print('Task date: ${task.date}');
    print('Current Date: $currentDate');
  }

  // Return the count of 'Day' tasks for the current date
  return dayTasks.length;
}
// ---------------------------------------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------------------week all---------------
int getWeekTasksCountwk() {
  // Get the list of tasks from the notifier
  List<Workoutmodel> tasks = workoutListNotifier.value;

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the start and end dates of the current week (Monday to Sunday)
  DateTime startOfWeek = currentDate.subtract(Duration(days: currentDate.weekday - 1)).subtract(Duration(days: 1));
  DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

  // Filter tasks where the duration is 'Week' or 'Day' and the task's date is within the current week
  List<Workoutmodel> weekAndDayTasks = tasks.where((task) {
    DateTime taskDate = task.date!;
    bool isWithinWeek = taskDate.isAfter(startOfWeek) && taskDate.isBefore(endOfWeek.add(Duration(days: 1)));

    print('Task date: ${task.date}');
    print('Current Week: $startOfWeek to $endOfWeek');
    print('Is Within Week: $isWithinWeek');

    return (task.duration == 'Week' || task.duration == 'Day') && isWithinWeek;
  }).toList();

  // Print task date range and current week's date range
  for (Workoutmodel task in weekAndDayTasks) {
    print('Task date: ${task.date}');
    print('Current Week: $startOfWeek to $endOfWeek');
  }

  // Return the count of 'Week' and 'Day' tasks for the current week
  return weekAndDayTasks.length;
}
// ---------------------------------------------------------------------------------------------------------------------
// -------------------------------------------week completed------------------------------------------------------
int getWeekTasksCountCheckeds() {
  // Get the list of tasks from the notifier
  List<Workoutmodel> tasks = workoutListNotifier.value;

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the start and end dates of the current week (Monday to Sunday)
  DateTime startOfWeek = currentDate.subtract(Duration(days: currentDate.weekday - 1)).subtract(Duration(days: 1));
  DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

  // Filter tasks where the duration is 'Week' or 'Day', the task's date is within the current week, and isChecked is true
  List<Workoutmodel> weekTasks = tasks.where((task) {
    DateTime taskDate = task.date!;
    bool isWithinWeek = taskDate.isAfter(startOfWeek) && taskDate.isBefore(endOfWeek.add(Duration(days: 1)));

    print('Task date: ${task.date}');
    print('Current Week: $startOfWeek to $endOfWeek');
    print('Is Within Week: $isWithinWeek');

    return (task.duration == 'Week' || task.duration == 'Day') &&
        isWithinWeek &&
        task.isChecked;
  }).toList();

  // Print task date range and current week's date range
  for (Workoutmodel task in weekTasks) {
    print('Task date: ${task.date}');
    print('Current Week: $startOfWeek to $endOfWeek');
  }

  // Return the count of 'Week' or 'Day' tasks for the current week that are checked
  return weekTasks.length;
}
// ----------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------month all-----------------------------
int getMonthTasksCount() {
  // Get the list of tasks from the notifier
  List<Workoutmodel> tasks = workoutListNotifier.value;

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the start and end dates of the current month
  DateTime startOfMonth = DateTime(currentDate.year, currentDate.month, 1);
DateTime endOfMonth = DateTime(currentDate.year, currentDate.month + 1, 0);

// Subtract one day from startOfMonth
startOfMonth = startOfMonth.subtract(Duration(days: 1));

// Filter tasks where the duration is 'Week', 'Day', or 'Month',
// the task's date is within the current month, and isChecked is true
List<Workoutmodel> monthAndDayTasks = tasks.where((task) {
  DateTime taskDate = task.date!;
  return (task.duration == 'Week' || task.duration == 'Day' || task.duration == 'Month') &&
      taskDate.isAfter(startOfMonth) && taskDate.isBefore(endOfMonth.add(Duration(days: 1)));
}).toList();

  // Print task date range and current month's date range
  for (Workoutmodel task in monthAndDayTasks) {
    print('Task date: ${task.date}');
    print('Current Month: $startOfMonth to $endOfMonth');
  }

  // Return the count of 'Week' and 'Day' tasks for the current month
  return monthAndDayTasks.length;
}
// ------------------------------------------------------------------completed month----------------------
int getMonthTasksCountmonth() {
  // Get the list of tasks from the notifier
  List<Workoutmodel> tasks = workoutListNotifier.value;

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the start and end dates of the current month
  DateTime startOfMonth = DateTime(currentDate.year, currentDate.month, 1);
  DateTime endOfMonth = DateTime(currentDate.year, currentDate.month + 1, 0);

  // Subtract one day from startOfMonth
  startOfMonth = startOfMonth.subtract(Duration(days: 1));

  // Filter tasks where the duration is 'Week', 'Day', or 'Month',
  // the task's date is within the current month, and isChecked is true
  List<Workoutmodel> monthAndDayTasks = tasks.where((task) {
    DateTime taskDate = task.date!;
    return (task.duration == 'Week' || task.duration == 'Day' || task.duration == 'Month') &&
        taskDate.isAfter(startOfMonth) && taskDate.isBefore(endOfMonth.add(Duration(days: 1))) &&
        task.isChecked;
  }).toList();

  // Print task date range and current month's date range
  for (Workoutmodel task in monthAndDayTasks) {
    print('Task date: ${task.date}');
    print('Current Month: $startOfMonth to $endOfMonth');
  }
  // Return the count of 'Week', 'Day', and 'Month' tasks for the current month
  return monthAndDayTasks.length;
}

