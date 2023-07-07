import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      initialBinding: MyBindings(),
      getPages: [],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF5886FF),
          onPrimary: Colors.black87,
        ),
        useMaterial3: true,
      ),
    );
  }
}
