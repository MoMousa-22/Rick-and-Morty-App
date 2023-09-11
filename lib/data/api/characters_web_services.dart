import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000, //30 second
      receiveTimeout: 30 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    Response response = await dio.get('character');
    return response.data['results'];
  }
}