import 'package:get/get.dart';
import 'package:sqflite/student_management/binding/home_binding.dart';
import 'package:sqflite/student_management/presentation/screen/add_student.dart';
import 'package:sqflite/student_management/presentation/screen/home_screen.dart';

class Routes {
  static const String home = "/";
  static const String add = "/add";

  static List<GetPage> page = [
    GetPage(name: home, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: add, page: () => AddStudent()),
  ];
}
