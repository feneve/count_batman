import 'package:bloc_count_batman/counter/bloc/counter_event.dart';
import 'package:bloc_count_batman/counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc  extends Bloc<CounterEvent, CounterState>{

  CounterBloc() :super (CounterState(count: 0)){

    on<CounterIncrementPressed>((event,emit){
      emit(CounterState(count: state.count + 1));
    });
    on<CounterDecrementPressed>((event,emit){
      emit(CounterState(count: state.count - 1));
    });
    on<CounterResetPressed>((event,emit){
      emit(CounterState(count: 0));
    });
    on<CounterDoubleIncrementPressed>((event,emit){
      emit(CounterState(count: state.count * 2));
    });
  }
}