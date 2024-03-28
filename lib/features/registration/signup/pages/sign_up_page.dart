import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../signin/pages/login_page.dart';

import '../widgets/drop_down_container.dart';
import '../widgets/form_container_widget.dart';
import '../widgets/signup_authentication.dart';



// Add this enum for role selection
enum Role { client, agent }

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Add a variable to track the selected role
  Role _selectedRole = Role.client;

  bool isSigningUp = false;

  // Initialize SignUpAuthentication instance
  final SignUpAuthentication _authentication = SignUpAuthentication();

  @override
  void dispose() {
    _firstNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          reverse: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                FormContainerWidget(
                  controller: _firstNameController,
                  hintText: "First Name",
                  isPasswordField: false,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _usernameController,
                  hintText: "Username",
                  isPasswordField: false,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                SizedBox(height: 10),
                DropDownContainerWidget(
                  initialValue: _selectedRole,
                  onChanged: (Role value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                // Use the same FormContainerWidget for role selection
                SizedBox(height: 30),
                GestureDetector(
                  onTap: _signUp,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: isSigningUp
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                                (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String firstname = _firstNameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Now you have access to _selectedRole to include it in your signUp method
    // For demonstration purposes, I'm passing it as a String. You can modify
    // your signUp method accordingly.
    User? user = await _authentication.signUp(firstname, username, email, password, _selectedRole.toString());

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {
      Navigator.pushNamed(context, "/LoginPage");
    }
  }
}
