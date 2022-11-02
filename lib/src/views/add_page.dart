import 'dart:developer';

import 'package:crud_do_list/src/controllers/add_controller.dart';
import 'package:crud_do_list/src/models/crud_do_model.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final addController = AddController();
  final title = TextEditingController();
  final subtitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CrudDo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text(
              'Cadastrar Crud Do',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.subtitle1,
                  decoration: InputDecoration(
                    labelText: 'Título',
                    labelStyle: Theme.of(context).textTheme.subtitle2,
                    border: const UnderlineInputBorder(),
                  ),
                  controller: title,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 4,
                  maxLines: null,
                  style: Theme.of(context).textTheme.headline4,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    labelStyle: Theme.of(context).textTheme.subtitle2,
                    border: const UnderlineInputBorder(),
                  ),
                  controller: subtitle,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          addController.createCrudDo(CrudDoModel(title.text, subtitle.text));
          log('onPressedAdd');
          Navigator.of(context).pushNamed('/');
        },
        tooltip: 'Cadastrar Crud Do',
        child: const Icon(
          Icons.check,
        ),
      ),
    );
  }
}
