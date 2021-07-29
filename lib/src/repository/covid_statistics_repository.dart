import 'package:covid_statistics/src/model/covid_statistics.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {
  late var _dio;
  final bookshelfXml =
      '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <accDefRate>2.6359702544</accDefRate>
                <accExamCnt>364942</accExamCnt>
                <accExamCompCnt>350573</accExamCompCnt>
                <careCnt>5281</careCnt>
                <clearCnt>4144</clearCnt>
                <createDt>2020-03-26 10:40:50.50</createDt>
                <deathCnt>131</deathCnt>
                <decideCnt>9241</decideCnt>
                <examCnt>14369</examCnt>
                <resutlNegCnt>341332</resutlNegCnt>
                <seq>86</seq>
                <stateDt>20200326</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-26 10:40:50.50</updateDt>
            </item>
            <item>
                <accDefRate>2.6590574416</accDefRate>
                <accExamCnt>357896</accExamCnt>
                <accExamCompCnt>343618</accExamCompCnt>
                <careCnt>5410</careCnt>
                <clearCnt>3730</clearCnt>
                <createDt>2020-03-25 10:12:04.04</createDt>
                <deathCnt>126</deathCnt>
                <decideCnt>9137</decideCnt>
                <examCnt>14278</examCnt>
                <resutlNegCnt>334481</resutlNegCnt>
                <seq>85</seq>
                <stateDt>20200325</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-25 10:12:04.04</updateDt>
            </item>
            <item>
                <accDefRate>2.7126570651</accDefRate>
                <accExamCnt>348582</accExamCnt>
                <accExamCompCnt>333142</accExamCompCnt>
                <careCnt>5684</careCnt>
                <clearCnt>3507</clearCnt>
                <createDt>2020-03-24 10:20:57.57</createDt>
                <deathCnt>120</deathCnt>
                <decideCnt>9037</decideCnt>
                <examCnt>15440</examCnt>
                <resutlNegCnt>324105</resutlNegCnt>
                <seq>84</seq>
                <stateDt>20200324</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-24 10:20:57.57</updateDt>
            </item>
            <item>
                <accDefRate>2.7622623363</accDefRate>
                <accExamCnt>338036</accExamCnt>
                <accExamCompCnt>324408</accExamCompCnt>
                <careCnt>5884</careCnt>
                <clearCnt>3166</clearCnt>
                <createDt>2020-03-23 10:27:32.32</createDt>
                <deathCnt>111</deathCnt>
                <decideCnt>8961</decideCnt>
                <examCnt>13628</examCnt>
                <resutlNegCnt>315447</resutlNegCnt>
                <seq>82</seq>
                <stateDt>20200323</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-23 10:27:32.32</updateDt>
            </item>
            <item>
                <accDefRate>2.8045013239</accDefRate>
                <accExamCnt>331780</accExamCnt>
                <accExamCompCnt>317240</accExamCompCnt>
                <careCnt>6085</careCnt>
                <clearCnt>2909</clearCnt>
                <createDt>2020-03-22 10:07:28.28</createDt>
                <deathCnt>104</deathCnt>
                <decideCnt>8897</decideCnt>
                <examCnt>14540</examCnt>
                <resutlNegCnt>308343</resutlNegCnt>
                <seq>81</seq>
                <stateDt>20200322</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-22 10:07:28.28</updateDt>
            </item>
            <item>
                <accDefRate>2.8219560302</accDefRate>
                <accExamCnt>327509</accExamCnt>
                <accExamCompCnt>311805</accExamCompCnt>
                <careCnt>6325</careCnt>
                <clearCnt>2612</clearCnt>
                <createDt>2020-03-21 10:02:58.58</createDt>
                <deathCnt>102</deathCnt>
                <decideCnt>8799</decideCnt>
                <examCnt>15704</examCnt>
                <resutlNegCnt>303006</resutlNegCnt>
                <seq>80</seq>
                <stateDt>20200321</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-21 10:02:58.58</updateDt>
            </item>
            <item>
                <accDefRate>2.8730918280</accDefRate>
                <accExamCnt>316664</accExamCnt>
                <accExamCompCnt>301139</accExamCompCnt>
                <careCnt>6527</careCnt>
                <clearCnt>2233</clearCnt>
                <createDt>2020-03-20 10:15:59.59</createDt>
                <deathCnt>94</deathCnt>
                <decideCnt>8652</decideCnt>
                <examCnt>15525</examCnt>
                <resutlNegCnt>292487</resutlNegCnt>
                <seq>79</seq>
                <stateDt>20200320</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-20 10:15:59.59</updateDt>
            </item>
            <item>
                <accDefRate>2.9420857378</accDefRate>
                <accExamCnt>307024</accExamCnt>
                <accExamCompCnt>291120</accExamCompCnt>
                <careCnt>6789</careCnt>
                <clearCnt>1947</clearCnt>
                <createDt>2020-03-19 10:07:57.57</createDt>
                <deathCnt>91</deathCnt>
                <decideCnt>8565</decideCnt>
                <examCnt>15904</examCnt>
                <resutlNegCnt>282555</resutlNegCnt>
                <seq>78</seq>
                <stateDt>20200319</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-19 10:07:57.57</updateDt>
            </item>
            <item>
                <accDefRate>3.0121625056</accDefRate>
                <accExamCnt>295647</accExamCnt>
                <accExamCompCnt>279301</accExamCompCnt>
                <careCnt>6838</careCnt>
                <clearCnt>1540</clearCnt>
                <createDt>2020-03-18 10:26:15.15</createDt>
                <deathCnt>84</deathCnt>
                <decideCnt>8413</decideCnt>
                <examCnt>16346</examCnt>
                <resutlNegCnt>270888</resutlNegCnt>
                <seq>77</seq>
                <stateDt>20200318</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2020-03-18 10:26:15.15</updateDt>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>9</totalCount>
    </body>
</response>''';
  CovidStatisticsRepository() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://openapi.data.go.kr",
      queryParameters: {
        'serviceKey':
            'WYBetsmvlmXjNt/B66rL9qKv0QWs6d6CQ0hl/YCx6YK+26fmvbTwzqgSwksHgamGBwW640aGxwwJKb/Z5KR7zA==',
      },
    ));
  }
  Future<List<Covid19StatisticsModel>> fetchCovid19Statistics(
      {String? startDate, String? endDate}) async {
    var query = Map<String, String>();
    if (startDate != null) query.putIfAbsent("startCreateDt", () => startDate);
    if (endDate != null) query.putIfAbsent("endCreateDt", () => endDate);

    var response = await _dio.get(
      '/openapi/service/rest/Covid19/getCovid19InfStateJson',
      queryParameters: query,
    );
    print(response.data);
    final document = XmlDocument.parse(response.data);
    // final document = XmlDocument.parse(bookshelfXml);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return results
          .map<Covid19StatisticsModel>(
              (element) => Covid19StatisticsModel.fromXml(element))
          .toList();
    } else {
      return <Covid19StatisticsModel>[];
    }
  }
}
