import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/loginPage.dart';
import 'package:flutter_bloc_example/service/appRouter.dart';
import 'package:flutter_bloc_example/service/themeDoingly.dart';
// import 'package:path_provider/path_provider.dart';
import 'UI/registerScreen.dart';
import 'UI/tasks_screen.dart';
import 'blocExample/bloc/navigation_bloc.dart';
import 'blocs/blocExports.dart';
import 'modelTask/modelTask.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // if u use await dont forget async

  // final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  // add hydrated prefix to BlocOverrides
  BlocOverrides.runZoned(() => runApp(MyApp(
        appRouter: AppRouter(),
      )));

  // BlocOverrides.runZoned(() {
  //   WidgetsFlutterBinding.ensureInitialized();
    
  //   return runApp(MyApp(
  //     appRouter: AppRouter(),
  //   ));
  // });
}

// Main Fun for make tasks and other this will be in app from shared preferences
// dont forget to add Hydrated prefix to Bloc after reciving package

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   HydratedBloc.storage = await HydratedStorage.build(
//     storageDirectory: await getTemporaryDirectory(),
//   );
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.switchVal
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: LoginPage(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
