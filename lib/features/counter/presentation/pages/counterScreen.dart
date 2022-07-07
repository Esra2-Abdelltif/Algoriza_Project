import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/features/counter/presentation/widget/counterWidget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),centerTitle: true),
      body: CounterWidget(),
    );
  }
}
