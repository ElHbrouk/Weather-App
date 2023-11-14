class WeatherModel {
  final String cityName;
  final String conditionText;
  final double maxTmp;
  final double minTmp;
  final DateTime date;
  final String? image;
  final double avgTemp;

 const WeatherModel( {required this.cityName,
    required this.avgTemp,
    required this.conditionText,
    required this.maxTmp,
    required this.minTmp,
    required this.date,
    required this.image,
  });

  factory WeatherModel.fromJson(json) {
    var baseServce = json['forecast']['forecastday'][0];
    return WeatherModel(
      conditionText: baseServce['day']['condition']['text'],
      maxTmp: baseServce['day']['maxtemp_c'],
      minTmp: baseServce['day']['mintemp_c'],
      date: DateTime.parse(json['current']['last_updated']),
      image: baseServce['day']['condition']['icon'],
      avgTemp: baseServce['day']['avgtemp_c'],
      cityName: json['location']['name'],
    );
  }
}
