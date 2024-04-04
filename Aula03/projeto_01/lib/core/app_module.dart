import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_01/access/pages/forgot_password.dart';
import 'package:projeto_01/access/pages/login.dart';
import 'package:projeto_01/dashboard/home_page.dart';

import '../access/pages/signup.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => LoginPage(),
    );
    r.child(
      '/forgotpassword/',
      child: (context) => ForgotPasswordPage(),
      transition: TransitionType.fadeIn,
    );
    r.child(
      '/signup/',
      child: (context) => SignupPage(),
    );

    r.child(
      '/dashboard/',
      child: (context) => HomePage(),
      transition: TransitionType.downToUp,
    );
  }
}
