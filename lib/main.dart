import 'package:first_project/module/dashboard/page.dart';
import 'package:first_project/module/login/page.dart';
import 'package:first_project/module/notes/page.dart';
import 'package:first_project/module/settings/page.dart';
import 'package:first_project/module/splashScreen/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'module/home/page.dart';
import 'translations/messages.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/settings', page: () => SettingsPage()),
        GetPage(name: '/addNotes', page: () => NotesPage()),
      ],
      translations: Messages(), // your translations
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'UK'),
      home: HomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme()
      ),
    );
  }
}

