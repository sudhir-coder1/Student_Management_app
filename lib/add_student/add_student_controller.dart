import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AddStudentController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final courseController = TextEditingController();
  final feesController = TextEditingController();

  Rx<File?> pickedImage = Rx<File?>(null);

  Database? _db;

  // Getter jo ensure karega ki database use karne se pehle initialize ho jaye
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "student_management.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE students (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            course TEXT,
            fees TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        pickedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image: $e");
    }
  }

  Future<void> addStudent() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String course = courseController.text.trim();
    String fees = feesController.text.trim();

    if (name.isEmpty || email.isEmpty) {
      Get.snackbar(
        "Required Fields",
        "Please enter at least Name and Email",
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
      );
      return;
    }

    try {
      // Getter ka use karein taaki database null na ho
      final dbClient = await database;
      
      await dbClient.insert("students", {
        "name": name,
        "email": email,
        "course": course,
        "fees": fees,
        "image": pickedImage.value?.path ?? "",
      });

      _clearFields();

      Get.back(); 
      Get.snackbar(
        "Success", 
        "Student record saved successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar("Error", "Could not save student: $e");
    }
  }

  void _clearFields() {
    nameController.clear();
    emailController.clear();
    courseController.clear();
    feesController.clear();
    pickedImage.value = null;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    courseController.dispose();
    feesController.dispose();
    super.onClose();
  }
}
