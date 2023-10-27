import 'package:bloc_mini_project_hive/utils/services/notifications.dart';
import 'package:bloc_mini_project_hive/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/authentication/firebaseAuthentication.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formkey = GlobalKey<FormState>();

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/svg/Animation - 1689407515577.json'),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailEditingController,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please Enter valid Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please Enter Password of min length 6';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        LocalNotification.showSimpleNotification(
                            title: "Simple Notification",
                            body: "This is a simple notification",
                            payload: "This is a simple data");
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          AuthServices.signupUser(emailEditingController.text,
                              passEditingController.text, context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(
                                255, 48, 83, 118)), // Background color
                        elevation:
                            MaterialStateProperty.all(8), // Elevation (shadow)
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                          ),
                        ),
                      ),
                      child: Container(
                        width: double
                            .infinity, // Makes the button take the full width
                        padding: const EdgeInsets.symmetric(
                            vertical: 16), // Adjust padding as needed
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign
                              .center, // Center aligns the text within the button
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Register'),
                        Text('Forgot Password ?'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Divider(),
                        ),
                        Text(
                          'Or',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(
                          width: 150,
                          child: Divider(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text.rich(
                      TextSpan(
                        text: 'New User? ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
