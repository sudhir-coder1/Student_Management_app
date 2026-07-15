import 'package:get/get.dart';
import 'package:student/add_student/add_student_binding.dart';
import 'package:student/add_student/add_student_screen.dart';
import 'home/binding.dart';
import 'home/home_screen.dart';

class AppRoute {
  static const String home = "/";
  static const String addStudent = "/add-student";



  static List<GetPage> page = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: addStudent,
      page: () => const AddStudentScreen(),
      binding: AddStudentBinding(),
    ),

  ];
}
