import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String apiKey = 'a33a6d2fb08641b5892213931232901';
  String baseUrl = 'https://api.weatherapi.com/v1';
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String? cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json ?key=$apiKey&q=$cityName&days=1');
      Map<String, dynamic> jsonData = response.data;

      return WeatherModel.fromJson(jsonData);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'there is an error';
      throw Exception(errorMessage);
    }catch(e){
      throw Exception('try later');
    }
  }
}
