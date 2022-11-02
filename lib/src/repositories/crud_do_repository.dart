import 'package:crud_do_list/src/models/crud_do_model.dart';
import 'package:dio/dio.dart';

class CrudDoRepository {
  late Dio dio;
  final String url =
      'https://crudcrud.com/api/73447b198f0f4b499eac2ed172f804c6';

  CrudDoRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<CrudDoModel>> fetchCrudDos() async {
    final response = await dio.get('$url/cruddo');
    final list = response.data as List;
    return list.map((json) => CrudDoModel.fromJson(json)).toList();
  }

  Future<bool> createCrudDo(CrudDoModel cruddo) async {
    final response = await dio.post('$url/cruddo', data: {
      'title': cruddo.title,
      'subtitle': cruddo.subtitle,
      'done': cruddo.done
    });
    print(response.statusCode);
    return false;
  }
}
