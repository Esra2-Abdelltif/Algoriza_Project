import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_algoriza/core/util/Bloc/cubit.dart';
import 'package:flutter_project_algoriza/features/User/presention/pages/user_screen.dart';
import 'package:flutter_project_algoriza/features/counter/presentation/cubit/cubit.dart';
import 'package:flutter_project_algoriza/features/onboarding_screen/presentation/pages/onboarding_screen.dart';
import 'package:flutter_project_algoriza/core/util/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (context) => AppBloc()..CreatDataBase(),),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
         theme: lightthemes,
        home: const UserScreen(),
      ),
    );
  }
}

