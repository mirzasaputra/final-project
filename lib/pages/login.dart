import 'package:finalproject/component/general/form_input.dart';
import 'package:finalproject/component/pages/login/title_component.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleComponent(
                title: "WELCOME BACK",
                subtitle: "Please sign in with your account",
                textAlign: TextAlign.left,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.width - 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login-ilustration.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FormInput(
                      controller: _usernameController,
                      label: 'Username',
                      placeholder: 'Enter your username',
                      prefixIcon: const Icon(Icons.person_outline, color: Colors.grey),
                    ),
                    const SizedBox(height: 10.0),
                    FormInput(
                      controller: _passwordController,
                      label: 'Password',
                      placeholder: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Checkbox(
                          onChanged: (value) => setState(() {
                            if (rememberMe) {
                              rememberMe = false;
                            } else {
                              rememberMe = true;
                            }
                          }),
                          value: rememberMe,
                          checkColor: Colors.white,
                          activeColor: Colors.blue,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Text('Remember Me'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _checkLogin(context, _usernameController.text, _passwordController.text);
                        }
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.blue,
                              Colors.blue.shade900,
                            ],
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 40.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text('Sign In', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static _checkLogin(BuildContext context, String username, String password) {
    if (username == 'root' && password == 'root') {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/main-page');
    } else {
      _showToast(context, "Username or Password doesn't match.");
    }
  }

  static _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
        content: Row(children: [
      const Icon(Icons.close_rounded, color: Colors.red),
      const SizedBox(width: 5.0),
      Text(message),
    ])));
  }
}
