// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('RNS Task App', () {
    FlutterDriver? driver;
    final _goToRegisterButton = find.byValueKey('go_to_register');
    final _registerEmailTextField = find.byValueKey('register_email_field');
    final _registerPasswordTextField =
        find.byValueKey('register_password_field');
    final _registerUserButton = find.byValueKey('register_user');

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('register user', () async {
      //tapping register button
      await driver!.tap(_goToRegisterButton);
      // enters text into register email field
      await driver!.tap(_registerEmailTextField);
      await driver!.enterText('demo@gmail.com');
      // enters text into register password field
      await driver!.tap(_registerPasswordTextField);
      await driver!.enterText('123456');
      // register user button tap
      await driver!.tap(_registerUserButton);
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
