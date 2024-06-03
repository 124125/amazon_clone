import "package:amazon_clone/constants/globle_variables.dart";
import "package:flutter/material.dart";

enum Auth { signup, signin }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 22,
              ),
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text(
                "Create Account",
                style: TextStyle(fontSize: 22),
              ),
              leading: Radio(
                  activeColor: GlobleVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text(
                "Sign In",
                style: TextStyle(fontSize: 22),
              ),
              leading: Radio(
                  activeColor: GlobleVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            )
          ],
        ),
      )),
    );
  }
}
