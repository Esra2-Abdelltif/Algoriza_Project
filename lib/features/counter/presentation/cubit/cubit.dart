import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_algoriza/features/counter/presentation/cubit/state.dart';

class CounterCubit extends Cubit<CounterStates>{
 // CounterCubit(CounterEvents initialState) : super(initialState);


  CounterCubit() : super(CounterInitialState());
  static  CounterCubit get(context) => BlocProvider.of(context);
  int counter=0;
  void CounterDecrementFun(){
    if(counter!=0){
      counter--;
      emit(CounterDecrementState(counter));
    }

  }
  void CounterIncrementFun(){
    counter++;
    emit(CounterIncrementState(counter));
  }

}