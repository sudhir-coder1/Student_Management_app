
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:student/page_route.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     getPages:AppRoute.page,
      debugShowCheckedModeBanner: false,

    ) ;
  }
}
