import 'dart:developer';

import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  _start() {
    return Container();
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _success() {
    return ListView.builder(
        itemCount: homeController.cruddos.length,
        itemBuilder: (context, index) {
          var cruddo = homeController.cruddos[index];
          print(cruddo.done);
          return ListTile(
            leading: Checkbox(
              value: cruddo.done,
              onChanged: (bool? value) {
                setState(() {
                  cruddo.done = value!;
                });
              },
            ),
            title: Text(
              cruddo.title!,
              style: TextStyle(
                  decoration: (cruddo.done ?? false)
                      ? TextDecoration.lineThrough
                      : null),
            ),
            subtitle: Text(
              cruddo.subtitle!,
              style: TextStyle(
                  decoration: (cruddo.done ?? false)
                      ? TextDecoration.lineThrough
                      : null),
            ),
          );
        });
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          homeController.start();
        },
        child: const Text('Tentar novamente'),
      ),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();

    homeController.start();
  }

  void onPressedAdd() {
    log('onPressedAdd');
    Navigator.of(context).pushNamed('/create');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CrudDo List'),
        actions: [
          IconButton(
            onPressed: () {
              homeController.start();
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: homeController.state,
        builder: (context, child) {
          return stateManagement(homeController.state.value);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: onPressedAdd,
        tooltip: 'Cadastrar Crud Do',
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
