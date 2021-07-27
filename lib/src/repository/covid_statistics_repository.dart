import 'package:covid_statistics/src/model/covid_statistics.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {
  late var _dio;
  CovidStatisticsRepository() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://openapi.data.go.kr",
      queryParameters: {
        'serviceKey':
            'WYBetsmvlmXjNt/B66rL9qKv0QWs6d6CQ0hl/YCx6YK+26fmvbTwzqgSwksHgamGBwW640aGxwwJKb/Z5KR7zA==',
      },
    ));
  }
  Future<Covid19StatisticsModel> fetchCovid19Statistics() async {
    var response =
        await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson');
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return Covid19StatisticsModel.fromXml(results.first);
    } else {
      return Future.value(null);
    }
  }
}
