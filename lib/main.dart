import 'package:bloc_count_batman/counter/bloc/counter_bloc.dart';
import 'package:bloc_count_batman/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context)=> CounterBloc(),
  child: const MaterialApp(
     debugShowCheckedModeBanner: false,
     home:  CounterPage(),
  ),
    );
  }
}