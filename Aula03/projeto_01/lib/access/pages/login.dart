import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool rememberMe = false;
  String _email = '';
  SharedPreferences? _prefs;
  TextEditingController? _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _emailController!.addListener(() {
      _email = _emailController!.text;
    });
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      _emailController?.text = _prefs?.getString('email') ?? '';
      if (_emailController!.text.isNotEmpty) {
        setState(() {
          rememberMe = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      height: 10,
    );
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              focusNode: emailFocusNode,
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                print(value);
              },
              onSubmitted: (value) {
                _email = value;
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              onEditingComplete: () {
                print('Editing complete');
              },
            ),
            divider,
            TextField(
              focusNode: passwordFocusNode,
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 10),
                ),
                labelText: 'Password',
              ),
              onSubmitted: (value) => _goToHomePage(),
            ),
            divider,
            ElevatedButton(
              onPressed: _goToHomePage,
              child: const Text('Login'),
            ),
            divider,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Modular.to.pushNamed('/forgotpassword'),
                  child: const Text('Forgot password?'),
                ),
                TextButton(
                  onPressed: () => Modular.to.navigate(
                    '/signup/',
                  ),
                  child: const Text('Sign up'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Checkbox(
                    value: rememberMe,
                    onChanged: (status) {
                      setState(() {
                        rememberMe = status!;
                      });
                    }),
                const Text('Remember me'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _goToHomePage() async {
    if (rememberMe) {
      await _saveData();
    }
    Modular.to.navigate('/dashboard/');
  }

  _saveData() async {
    await _prefs?.setString('email', _emailController!.text);
  }
}
