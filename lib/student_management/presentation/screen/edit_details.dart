import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import '../../../custom_Text_Feild.dart';

class EditDetails extends StatelessWidget {
  const EditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Detail"),
      ),
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.save), Text("Update Detail")]),
          ),
        ],
      ).paddingSymmetric(horizontal: 20),

    );
  }
}
