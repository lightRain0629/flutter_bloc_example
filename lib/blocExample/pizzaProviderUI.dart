import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'exampleBloc/bloc/pizza_bloc.dart';
import 'model/pizzaModel.dart';
import 'dart:math';

class PizzaBlocUI extends StatelessWidget {
  const PizzaBlocUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
             if (state is PizzaInitial) {
               return CircularProgressIndicator();
             }
             if (state is PizzaLoaded) {
               return Column(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  Text('${state.pizzas.length}',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(alignment: Alignment.center, clipBehavior: Clip.none, 
                    children: [
                      for ( int index = 0; 
                      index < state.pizzas.length;
                      index++)
                      Positioned(
                        left: Random().nextInt(250).toDouble(),
                        top: Random().nextInt(400).toDouble(),
                        child: SizedBox(
                        width: 150,
                        height: 150,
                        child: state.pizzas[index].image,
                      ))
                    ],
                    ),
                  )
                ],
               );
             } else{
              return const Text( 'Something went wrong' );
             }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.remove_done),
            onPressed: (){
            context.read<PizzaBloc>().add(RemoveAllPizzas(Pizza.pizzas[0]));
          }),
          const SizedBox(height: 10,),
          FloatingActionButton(
            backgroundColor: Colors.amber,
            child: const Icon(Icons.local_pizza_outlined),
            onPressed: (){
            context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
          }),
          const SizedBox(height: 10,),
                    FloatingActionButton(
            backgroundColor: Colors.amber,
            child: const Icon(Icons.remove),
            onPressed: (){
            context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[0]));
          }),
          const SizedBox(height: 10,),
                    FloatingActionButton(
            backgroundColor: Colors.red,
            child: const Icon(Icons.local_pizza),
            onPressed: (){
            context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
          }),
                    const SizedBox(height: 10,),
                    FloatingActionButton(
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
            onPressed: (){
            context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1]));
          }),
        ],
      ),
    );
  }
}