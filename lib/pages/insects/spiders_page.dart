import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thesaurus/counter_bloc.dart';

class SpidersPage extends StatelessWidget {
  const SpidersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            backgroundColor: Colors.yellowAccent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterIncEvent());
                  },
                  icon: const Icon(Icons.plus_one),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterDecEvent());
                  },
                  icon: const Icon(Icons.exposure_minus_1),
                ),
                Center(
                  child: Text(
                    state.toString(),
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
