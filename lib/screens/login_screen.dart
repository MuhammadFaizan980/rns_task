import 'package:flutter/material.dart';
import 'package:rns_task/contracts/i_login_response.dart';
import 'package:rns_task/controllers/login_controller.dart';
import 'package:rns_task/screens/home_screen.dart';
import 'package:rns_task/screens/register_screen.dart';
import 'package:rns_task/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements ILoginResponse {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  LoginController? _loginController;

  @override
  void initState() {
    _loginController = LoginController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                key: ValueKey('login_email_field'),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email here...',
                ),
              ),
              TextField(
                key: ValueKey('login_password_field'),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password here...',
                ),
              ),
              TextButton(
                key: ValueKey('login_user'),
                onPressed: () {
                  _loginController!.validateCredentials(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blue,
                  ),
                ),
              ),
              TextButton(
                key: ValueKey('go_to_register'),
                onPressed: () {
                  Utils.pushReplacement(context, RegisterScreen());
                },
                child: Text(
                  'Register',
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
    );
  }

  @override
  void onLoginError(String message) {
    Utils.displayMessage(context, message);
  }

  @override
  void onLoginSuccess() {
    Utils.pushReplacement(context, HomeScreen());
  }
}
