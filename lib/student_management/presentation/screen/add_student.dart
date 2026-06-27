import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_Text_Feild.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text("Name"),
          CustomTextField(icon: Icons.person, name: 'Enter Student Name'),
          Text("Email"),
          CustomTextField(
            icon: Icons.email_rounded,
            name: 'Enter Email Address',
          ),
          Text("Course"),

          CustomTextField(icon: Icons.school, name: 'Enter Course'),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)
              ),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: Row(children: [Icon(Icons.save), Text("Save Student")]),
          ),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
