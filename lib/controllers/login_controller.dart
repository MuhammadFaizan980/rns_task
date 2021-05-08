import 'package:firebase_auth/firebase_auth.dart';
import 'package:rns_task/contracts/i_login_response.dart';

class LoginController {
  ILoginResponse? _iLoginResponse;
  String? _email, _password;

  LoginController(this._iLoginResponse);

  void validateCredentials(String email, String password) {
    this._email = email;
    this._password =password;
    if (_email!.isEmpty) {
      _iLoginResponse!.onLoginError('Email cannot be empty');
    } else if (_password!.isEmpty) {
      _iLoginResponse!.onLoginError('Password cannot be empty');
    } else {
      _loginUser();
    }
  }

  void _loginUser() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _email!,
      password: _password!,
    )
        .then((value) {
      _iLoginResponse!.onLoginSuccess();
    }).catchError((error) {
      _iLoginResponse!.onLoginError(error.message);
    });
  }
}
