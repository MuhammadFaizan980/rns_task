// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('RNS Task App', () {
    FlutterDriver? driver;
    final _loginEmailTextField = find.byValueKey('login_email_field');
    final _loginPasswordTextField = find.byValueKey('login_password_field');
    final _loginUserButton = find.byValueKey('login_user');

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    test('login user', () async {
      // enters text into login email field
      await driver!.tap(_loginEmailTextField);
      await driver!.enterText('demo@gmail.com');
      // enters text into login password field
      await driver!.tap(_loginPasswordTextField);
      await driver!.enterText('123456');
      // login user button tap
      await driver!.tap(_loginUserButton);
      // detect home screen
      await driver!.waitFor(find.text('HOME'));
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });
  });
}
