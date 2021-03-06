import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_algoriza/core/util/widgets/customButton.dart';
import 'package:flutter_project_algoriza/features/counter/presentation/cubit/state.dart';

import '../cubit/cubit.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=> CounterCubit(),
      child:BlocConsumer<CounterCubit,CounterStates>(
        listener:  (BuildContext context ,CounterStates state){
          if(state is CounterInitialState) {
            debugPrint('CounterInitialState');
            debugPrint('${BlocProvider.of<CounterCubit>(context).counter}');
          }
          if(state is CounterIncrementState) {
            debugPrint('CounterIncrementState');
            debugPrint('${BlocProvider.of<CounterCubit>(context).counter}');
          }
          if(state is CounterDecrementState) {
            debugPrint('CounterDecrementState');
            debugPrint('${BlocProvider.of<CounterCubit>(context).counter}');
          }
          if(state is CounterClearState) {
            debugPrint('CounterClearState');
            debugPrint('${BlocProvider.of<CounterCubit>(context).counter}');
          }
        },
        builder:  (BuildContext context ,CounterStates state) {
          var Cubit = CounterCubit.get(context);
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Spacer(),
              Column(
                children: [
                  Text('by Using Bloc',style: TextStyle(fontSize: 30)),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                         Cubit.CounterIncrementFun();
                        },

                        child:
                        const Icon(
                          Icons.add,size: 40,
                        ),


                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('${Cubit.counter}', style: TextStyle(
                          fontSize: 30,),),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          Cubit.CounterDecrementFun();
                        },
                        child:const Icon(
                          Icons.remove,size: 40,
                        ),

                      ),
                    ],
                  ),
                ],
              ),
             Spacer(),
              CustomButton(text: 'Clear', width: double.infinity,
                  height: 70, fontsize: 25,borderRadius: 1,
                  onTap:( ){Cubit.CounterClear();}),

            ],
          );
        },

      ),

    );
  }
}
