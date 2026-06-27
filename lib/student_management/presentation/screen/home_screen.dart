import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/route.dart';

import '../../../custom_Text_Feild.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Management")),

      floatingActionButton: IconButton(
        onPressed: () {
          Get.toNamed(Routes.add);
        },
        style: IconButton.styleFrom(backgroundColor: Colors.blue),
        icon: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: Column(
        children: [
          CustomTextField(icon: Icons.search, name: 'Search Student',),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://img.magnific.com/free-photo/nature-landscape-with-hand-holding-frame_23-2149389976.jpg?semt=ais_hybrid&w=740&q=80",
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sudhir"),
                          Text("SudhirBind2eu@gmail.com"),
                          Text(
                            "Flutter",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight(569),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: () {
                        Get.toNamed(Routes.edit);
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
