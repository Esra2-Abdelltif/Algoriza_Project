import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/core/util/style/colors.dart';
import 'package:flutter_project_algoriza/features/counter/presentation/widget/counterWidget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CounterWidget(),
    );
  }
}
