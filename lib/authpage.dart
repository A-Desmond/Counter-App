// ignore_for_file: prefer_const_constructors

import 'package:counter_app/logic.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController username = TextEditingController();

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Text('RGESTER'),
              SizedBox(
                height: 10,
              ),
              TextField(
                key: Key('username'),
                controller: username,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                key: Key('email'),
                controller: email,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                key: Key('password'),
                controller: password,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              MaterialButton(
                key: Key('Rigester  button'),
                onPressed: () {
                  FirebaseBackEnd.registerUser(
                      context, email.text, username.text, password.text);
                },
                color: Colors.blue,
                child: Text('REGISTER'),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  key: Key('login'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('LOGIN'))
            ],
          ),
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController emailLogin = TextEditingController();
TextEditingController passwordLogin = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Text('LOGIN'),
              SizedBox(
                height: 10,
              ),
              TextField(
                key: Key('login email'),
                controller: emailLogin,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                key: Key('login password'),
                controller: passwordLogin,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              MaterialButton(
                key: Key('login button'),
                onPressed: () {
                  FirebaseBackEnd.userlogin(
                      context, emailLogin.text, passwordLogin.text);
                },
                color: Colors.blue,
                child: Text('LOGIN'),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  key: Key('register'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text('REGISTER'))
            ],
          ),
        ),
      ),
    );
  }
}
