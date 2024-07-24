import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/constants/globle_variables.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',

      // whenever navigator.push or named route is called this onGenerateRoute will be called in

      onGenerateRoute: (settings) => generateRoute(settings),

      // theme data on how app ui will look like
      //
      theme: ThemeData(
        // useMaterial3: true,
        useMaterial3: false,
        scaffoldBackgroundColor: GlobleVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
        colorScheme: const ColorScheme.light(
          primary: GlobleVariables.secondaryColor,
        ),
      ),

      // home page will be open when u open app for first time
      home: AuthScreen(),
    );
  }
}
