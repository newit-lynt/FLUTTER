import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/home_bloc.dart';
import '../logic/home_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,

      listener: (context, state) {},
      // listenWhen: (previous, current) {

      // },
      // buildWhen: (previous, current) {

      // },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('xom chO'),
            backgroundColor: Colors.blueGrey,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
          ),
        );
      },
    );
  }
}
