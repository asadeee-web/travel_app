import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/home/home_screen.dart';
import 'package:travel_app/features/home/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: GetMaterialApp(
        title: 'Travel App',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffF4F6F8),
          textTheme: GoogleFonts.instrumentSansTextTheme(),
        ),
        home: HomeScreen(),
      ),
    );
    ;
  }
}
