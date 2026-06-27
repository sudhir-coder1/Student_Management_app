import 'package:get/get.dart';
import 'package:sqflite/student_management/presentation/controller/add_student_controller.dart';
import 'package:sqflite/student_management/presentation/controller/edit_detail_controller.dart';
import 'package:sqflite/student_management/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>AddStudentController());
    Get.lazyPut(()=>EditDetailController());
  }
}