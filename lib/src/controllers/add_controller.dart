import 'package:crud_do_list/src/models/crud_do_model.dart';
import 'package:crud_do_list/src/repositories/crud_do_repository.dart';

class AddController {
  final CrudDoRepository _crudDoRepository;

  AddController([CrudDoRepository? repository])
      : _crudDoRepository = repository ?? CrudDoRepository();

  Future<void> createCrudDo(CrudDoModel cruddo) async {
    final result = await _crudDoRepository.createCrudDo(cruddo);
    print(result);
  }
}
