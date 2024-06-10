import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_api/presentation/homepage/controller/home_page_controller.dart';
import 'package:shopping_cart_with_api/presentation/homepage/view/hompage.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('products');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomePageController(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}
