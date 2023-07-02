import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/storageTest/storageTest.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 100,
                ),
                radius: 80,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // It would be username 
            children: [Text(userData['username'].toString(), style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05),)],
          )
        ],
      ),
    );
  }
}
