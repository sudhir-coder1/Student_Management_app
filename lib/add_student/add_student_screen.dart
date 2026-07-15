import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_student_controller.dart';

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddStudentController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "New Student",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Picker UI
              Center(
                child: GestureDetector(
                  onTap: () => controller.pickImage(),
                  child: Obx(() => CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueAccent.withOpacity(0.1),
                    backgroundImage: controller.pickedImage.value != null
                        ? FileImage(controller.pickedImage.value!)
                        : null,
                    child: controller.pickedImage.value == null
                        ? const Icon(Icons.camera_alt, size: 40, color: Colors.blueAccent)
                        : null,
                  )),
                ),
              ),
              const SizedBox(height: 30),

              _buildLabel("Full Name"),
              _customTextField(
                controller: controller.nameController,
                hint: "Sudhir Bind",
                icon: Icons.person,
              ),
              const SizedBox(height: 20),

              _buildLabel("Email Address"),
              _customTextField(
                controller: controller.emailController,
                hint: "example@gmail.com",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              _buildLabel("Technology"),
              _customTextField(
                controller: controller.courseController,
                hint: "flutter,web,android",
                icon: Icons.book,
              ),
              const SizedBox(height: 20),

              _buildLabel("Total Fees"),
              _customTextField(
                controller: controller.feesController, // Updated to feesController
                hint: "25,000",
                icon: Icons.currency_rupee_outlined,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 40),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => controller.addStudent(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "SAVE STUDENT",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 8),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _customTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}