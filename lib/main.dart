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
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: ThemeData(
          // useMaterial3: true,
          scaffoldBackgroundColor: GlobleVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobleVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: GlobleVariables.secondaryColor,
            title: Text('hello')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AuthScreen.routeName);
                  },
                  child: const Text('open'));
            })
          ],
        ),
      ),
    );
  }
}
