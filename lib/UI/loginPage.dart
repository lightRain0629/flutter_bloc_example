import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/registerScreen.dart';
import 'package:flutter_bloc_example/UI/tasks_screen.dart';
import 'package:flutter_bloc_example/api/apiDoingly.dart';
import 'package:flutter_bloc_example/storageTest/storageTest.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiDoingly apiDoingly = ApiDoingly();

    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Doingly',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              height: 45,
              child: TextFormField(
                style: TextStyle(fontSize: 16),
                autofocus: true,
                controller: username,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  label: Text('Username'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
              child: TextFormField(
                style: TextStyle(fontSize: 16),
                autofocus: true,
                controller: password,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  label: Text('Password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: ApiDoingly().onPostLogin('/api/v1/users/login',
                          {
                            'username': username.text,
                            'password': password.text,
                          },
                          context),
              builder: (context, snapshotLogin) {
                return ElevatedButton(
                    onPressed: ()  {
                      userData['username'] = username.text;
                      userData['password'] = password.text;
                       apiDoingly.onPostLogin(
                          '/api/v1/users/login',
                          {
                            'username': username.text,
                            'password': password.text,
                          },
                          context);
                    },
                    child: Text('Login'));
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Dont have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text('Sign up'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
