import "package:amazon_clone/common/widgets/custom_button.dart";
import "package:amazon_clone/common/widgets/custom_textfield.dart";
import "package:amazon_clone/constants/globle_variables.dart";
import "package:flutter/material.dart";

enum Auth { signup, signin }

class AuthScreen extends StatefulWidget {
  // routename to be used for named calling
  static const routeName = '/auth-screen';

  // constructor
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // stores value of currently selected radio button.

  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobleVariables.greyBackgroundCOlor,
      body: SafeArea(
          // to make sure ui don't intersect with system ui components like notification bar
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),

            // sign up radio button
            ListTile(
              tileColor: _auth == Auth.signup
                  ? Colors.white
                  : GlobleVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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

            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobleVariables.backgroundColor,
                child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(text: 'Sign Up', onTap: () {})
                      ],
                    )),
              ),

            // slgn in

            ListTile(
              tileColor: _auth == Auth.signin
                  ? Colors.white
                  : GlobleVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign In",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            ),

            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobleVariables.backgroundColor,
                child: Form(
                    key: _signinFormKey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(text: 'Sign In', onTap: () {})
                      ],
                    )),
              ),
          ],
        ),
      )),
    );
  }
}
