import 'package:crud_do_list/src/repositories/crud_do_repository.dart';
import 'package:flutter/cupertino.dart';

import '../models/crud_do_model.dart';

class HomeController {
  List<CrudDoModel> cruddos = [];
  final CrudDoRepository _crudDoRepository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([CrudDoRepository? repository])
      : _crudDoRepository = repository ?? CrudDoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      cruddos = await _crudDoRepository.fetchCrudDos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
