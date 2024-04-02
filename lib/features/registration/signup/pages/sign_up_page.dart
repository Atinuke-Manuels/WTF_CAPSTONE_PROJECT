import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/common/toast.dart';
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
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController(); // Added confirm password controller

  // Add a variable to track the selected role
  Role _selectedRole = Role.client;

  bool isSigningUp = false;

  // Initialize SignUpAuthentication instance
  final SignUpAuthentication _authentication = SignUpAuthentication();

  // Focus nodes for each field
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _firstNameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose(); // Dispose confirm password controller

    // Dispose focus nodes
    _firstNameFocusNode.dispose();
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _addressFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.2.h,),
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                FormContainerWidget(
                  controller: _firstNameController,
                  hintText: "First Name",
                  isPasswordField: false,
                  focusNode: _firstNameFocusNode,
                  nextFocusNode: _usernameFocusNode,
                  errorMessage: _firstNameError,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _usernameController,
                  hintText: "Username",
                  isPasswordField: false,
                  focusNode: _usernameFocusNode,
                  nextFocusNode: _phoneFocusNode,
                  errorMessage: _usernameError,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _phoneController,
                  hintText: "Phone number",
                  isPasswordField: false,
                  focusNode: _phoneFocusNode,
                  nextFocusNode: _addressFocusNode,
                  errorMessage: _phoneError,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _addressController,
                  hintText: "Address",
                  isPasswordField: false,
                  focusNode: _addressFocusNode,
                  nextFocusNode: _emailFocusNode,
                  errorMessage: _addressError,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                  focusNode: _emailFocusNode,
                  nextFocusNode: _passwordFocusNode,
                  errorMessage: _emailError,
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
                  focusNode: _passwordFocusNode,
                  nextFocusNode: _confirmPasswordFocusNode,
                  errorMessage: _passwordError,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  // Added confirm password field
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
                  isPasswordField: true,
                  focusNode: _confirmPasswordFocusNode,
                  nextFocusNode: null,
                  errorMessage: _confirmPasswordError,
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: _signUp,
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: isSigningUp
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                                (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2.h,)
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

    // Reset error messages
    _resetErrors();

    String firstname = _firstNameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String address = _addressController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text; // Get confirm password

    // Regex patterns for validation
    RegExp namePattern = RegExp(r'^.{3,}$');
    RegExp emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    RegExp phonePattern = RegExp(r'^[0-9]{10}$');
    RegExp addressPattern = RegExp(r'^.{1,40}$');
    RegExp passwordPattern = RegExp(r'^.{8,}$');

    // Validate fields
    bool isValid = true;

    if (!namePattern.hasMatch(firstname)) {
      setState(() {
        _firstNameError = 'First name must be at least 3 characters.';
      });
      isValid = false;
    }
    if (!namePattern.hasMatch(username)) {
      setState(() {
        _usernameError = 'Username must be at least 3 characters.';
      });
      isValid = false;
    }
    if (!phonePattern.hasMatch(phone)) {
      setState(() {
        _phoneError = 'Invalid phone number format.';
      });
      isValid = false;
    }
    if (!addressPattern.hasMatch(address)) {
      setState(() {
        _addressError = 'Address must not exceed 40 characters.';
      });
      isValid = false;
    }
    if (!emailPattern.hasMatch(email)) {
      setState(() {
        _emailError = 'Invalid email address.';
      });
      isValid = false;
    }
    if (!passwordPattern.hasMatch(password)) {
      setState(() {
        _passwordError = 'Password must be at least 8 characters.';
      });
      isValid = false;
    }

    if (password != confirmPassword) {
      setState(() {
        _confirmPasswordError = 'Passwords do not match.';
      });
      isValid = false;
    }

    if (!isValid) {
      // Display error message
      setState(() {
        isSigningUp = false;
      });
      return;
    }

    // Check if the selected role is either "Client" or "Agent"
    if (_selectedRole != null &&
        (_selectedRole == Role.client || _selectedRole == Role.agent)) {
      // Now you have access to _selectedRole to include it in your signUp method
      User? user = await _authentication.signUp(
          firstname, username, phone, address, email, password, _selectedRole.toString());

      if (user != null) {
        Navigator.pushNamed(context, "/LoginPage");
      }
    } else {
      // Handle the case where "Select Role" option is chosen or an invalid role is selected
      // For example, display an error message or take appropriate action
      showToast(message: 'Please select a valid role (Client or Agent).');
    }
    setState(() {
      isSigningUp = false;
    });
  }

  // Error messages for each field
  String? _firstNameError;
  String? _usernameError;
  String? _emailError;
  String? _phoneError;
  String? _addressError;
  String? _passwordError;
  String? _confirmPasswordError;

  // Method to reset error messages
  void _resetErrors() {
    setState(() {
      _firstNameError = null;
      _usernameError = null;
      _emailError = null;
      _phoneError = null;
      _addressError = null;
      _passwordError = null;
      _confirmPasswordError = null;
    });
  }
}
