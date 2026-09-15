import 'dart:math';
import 'package:bloc_count_batman/counter/bloc/counter_bloc.dart';
import 'package:bloc_count_batman/counter/bloc/counter_event.dart';
import 'package:bloc_count_batman/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    
    // Pegamos a largura e altura uma única vez fora do loop
    final size = MediaQuery.of(context).size;
    final maxX = max(10.0, size.width - 100);
    final maxY = max(10.0, size.height - 130);

    return Scaffold(
      appBar: AppBar(title: const Text('Batman Bloc Counter')),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          // Usamos a mesma semente (Seed) no Random para não mudar 
          // a posição das imagens já existentes a cada clique
          final random = Random(42);

          return Stack(
            children: [
              
              // Geramos as posições de forma estável
              for (int i = 0; i < state.count; i++) ...[
                Builder(
                  builder: (context) {
                    final left = random.nextDouble() * maxX;
                    final top = random.nextDouble() * maxY;
                    
                    return Positioned(
                      top: top,
                      left: left,
                      child: Image.asset(
                        'assets/batman-logo-free-png.webp',
                        width: 380,
                        height: 380,
                        // Trata o erro caso o arquivo da imagem não seja encontrado
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error,
                            size: 60,
                            color: Colors.red,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () => counterBloc.add(CounterIncrementPressed()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => counterBloc.add(CounterDecrementPressed()),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'btn3',
            onPressed: () => counterBloc.add(CounterResetPressed()),
            child: const Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}