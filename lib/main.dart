import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/bindings.dart';
import 'package:to_do_app/views/addTask_screen.dart';
import 'package:to_do_app/views/home_screen.dart';

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
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const HomeScreen()),
        GetPage(name: "/addTask", page: () => const AddTaskScreen())
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: const ColorScheme.light(
            primary: Color(0xFF5886FF),
            onPrimary: Colors.white,
            secondary: Colors.black87,
            onSurface: Colors.white,
            surface: Colors.white),
        useMaterial3: true,
      ),
    );
  }

  static void changeStatusColor(Color color, Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarIconBrightness: brightness));
  }
}
