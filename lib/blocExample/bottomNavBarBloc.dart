import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/navigation_bloc.dart';

class BottomNavBarBloc extends StatelessWidget {
  const BottomNavBarBloc({super.key});



  Widget build(BuildContext context) {

  List bodyText = [
    Text('page zero'),
    Text('page first'),
    Text('page second'),
    Text('page third'),
  ];

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bodyText[state.count],
          ),
          bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              return BottomNavigationBar(
                  currentIndex: state.count,
                  onTap: (value) {
                    context.read<NavigationBloc>().add(OnTapEvent(index: value));
                  },
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.black,
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  ]);
            },
          ),
        );
      },
    );
  }
}
