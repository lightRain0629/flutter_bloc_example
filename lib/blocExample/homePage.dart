import 'package:flutter/material.dart';

bool valuee = false;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc examle'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
                title: Text('$index card'),
                trailing: Checkbox(
                  onChanged: (bool? value) {
                    bool indexVal = false;
                    indexVal = value!;
                    setState(() {});
                  },
                  value: valuee,
                ),
              )),
    );
  }
}
