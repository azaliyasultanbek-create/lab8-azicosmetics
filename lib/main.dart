import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'screens/catalog_screen.dart';
void main() {
  runApp(const MyApp());
}
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
  };
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AZI Cosmetics',
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
        primaryColor: const Color(0xFFB76E79),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB76E79),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF9F8),
        useMaterial3: true,
      ),
      home: const CatalogScreen(),
    );
  }
}