import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:udevs_task/model/task_model/task_model.dart';
import 'package:udevs_task/my_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

Box? taskBox;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  hiveRegisters();
  runApp(const MyApp());

  taskBox = await Hive.openBox('personal');
  taskBox = await Hive.openBox('work');
  taskBox = await Hive.openBox('meeting');
  taskBox = await Hive.openBox('shopping');
  taskBox = await Hive.openBox('party');
  taskBox = await Hive.openBox('study');
}

hiveRegisters() {
  Hive.registerAdapter(TaskModelAdapter());
}
