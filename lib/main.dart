import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hara_store/blocs/cart.bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => MyBloc(),
        child: MyScreen(),
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBloc, List<ProductCart>>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('My App ${state.length}')),
          body: ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index].name),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context
                  .read<MyBloc>()
                  .addItem(ProductCart(id: 1, name: 'Cireng'));
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
