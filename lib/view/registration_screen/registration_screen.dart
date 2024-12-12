import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_event_booking_app/controller/registration_screen_controller.dart';
import 'package:sports_event_booking_app/main.dart';
import 'package:sports_event_booking_app/utils/color_constans.dart';
import 'package:sports_event_booking_app/view/login_Screen/login_screen.dart';
import 'package:sports_event_booking_app/widgets/custom_buttons.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create\nAccount",
                    style: TextStyle(
                      color: ColorConstans.primaryGreen,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}\$')
                          .hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: confirmPassController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      } else if (value != passController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  customeButton(
                    height: 50,
                    width: double.infinity,
                    text: "Register",
                    onPressedButton: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<RegistrationScreenController>()
                            .onRegistration(
                                email: emailController.text,
                                password: passController.text);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
