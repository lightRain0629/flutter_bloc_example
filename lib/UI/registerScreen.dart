import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/loginPage.dart';
import 'package:flutter_bloc_example/UI/tasks_screen.dart';
import 'package:flutter_bloc_example/blocExample/model/tokenModel.dart';
import 'package:flutter_bloc_example/blocExample/model/userModel.dart';
import '../api/apiDoingly.dart';
import '../storageTest/storageTest.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    ApiDoingly apiDoingly = ApiDoingly();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
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
              child: TextField(
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
              child: TextField(
                style: TextStyle(fontSize: 16),
                autofocus: true,
                controller: email,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  label: Text('Email'),
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
              child: TextField(
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
            ElevatedButton(
                onPressed: () {
                  userData['username'] = username.text;
                  userData['password'] = password.text;
                  var token = apiDoingly.onPostReg({
                    'username': username.text,
                    'email': email.text,
                    'password': password.text,
                  }, context);
                  print(token);
                },
                child: Text('Register')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Sign in'),
                )
              ],
            )
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.15,
            // )
          ],
        ),
      ),
    );
  }
}
