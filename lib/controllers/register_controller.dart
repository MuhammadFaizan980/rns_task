import 'package:firebase_auth/firebase_auth.dart';
import 'package:rns_task/contracts/i_register_response.dart';

class RegisterController {
  IRegisterResponse? _iRegisterResponse;
  String? _email, _password;

  RegisterController(this._iRegisterResponse);

  void validateCredentials(String email, String password) {
    this._email = email;
    this._password = password;
    if (_email!.isEmpty) {
      _iRegisterResponse!.onRegisterError('Email cannot be empty');
    } else if (_password!.isEmpty) {
      _iRegisterResponse!.onRegisterError('Password cannot be empty');
    } else {
      _registerUser();
    }
  }

  void _registerUser() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _email!,
      password: _password!,
    )
        .then((value) {
      _iRegisterResponse!.onRegisterSuccess();
    }).catchError((error) {
      _iRegisterResponse!.onRegisterError(error.message);
    });
  }
}
