import 'package:flutter/material.dart';
import 'package:rns_task/contracts/i_register_response.dart';
import 'package:rns_task/controllers/register_controller.dart';
import 'package:rns_task/screens/home_screen.dart';
import 'package:rns_task/screens/login_screen.dart';
import 'package:rns_task/utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements IRegisterResponse {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  RegisterController? _registerController;

  @override
  void initState() {
    _registerController = RegisterController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                TextField(
                  key: ValueKey('register_email_field'),
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email here...',
                  ),
                ),
                TextField(
                  key: ValueKey('register_password_field'),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password here...',
                  ),
                ),
                TextButton(
                  key: ValueKey('register_user'),
                  onPressed: () {
                    _registerController!.validateCredentials(
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue,
                    ),
                  ),
                ),
                TextButton(
                  key: ValueKey('go_to_login'),
                  onPressed: () {
                    Utils.pushReplacement(context, LoginScreen());
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Utils.pushReplacement(context, LoginScreen());
        return true;
      },
    );
  }

  @override
  void onRegisterError(String message) {
    Utils.displayMessage(context, message);
  }

  @override
  void onRegisterSuccess() {
    Utils.pushReplacement(context, HomeScreen());
  }
}
