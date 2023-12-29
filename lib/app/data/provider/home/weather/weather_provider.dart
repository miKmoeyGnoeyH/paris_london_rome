import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../model/home/map/latlng_model.dart';
import '../../../model/home/weather/weather_model.dart';
import '../../../model/home/weather/xy_model.dart';

const baseUrl =
    'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?'
    'serviceKey=oF%2BNI9vxzODLGGykl5ZR2Oa2qzM%2FWqh1rvP9nTcJp1PHFysspwCH4STNI43sNCkuGq62g1VyWt3QnaQrhiCvcQ%3D%3D'
    '&numOfRows=12'
    '&pageNo=1'
    '&dataType=JSON';

class WeatherProvider {
  final http.Client httpClient;

  WeatherProvider({required this.httpClient});

  getWeather(LatLngModel latLng) async {
    if (latLng.latitude != null && latLng.longitude != null) {
      DateTime now = DateTime.now();
      final String baseDate = DateFormat('yyyyMMdd').format(now);
      final String baseTime = (now.hour - ((now.hour - 2) % 3))
          .toString()
          .padLeft(2, '0')
          .padRight(4, '0');
      XYModel xyModel = XYModel.fromLatLng(latLng: latLng);

      final String requestUrl =
          '$baseUrl&base_date=$baseDate&base_time=$baseTime&nx=${xyModel.x}&ny=${xyModel.y}';
      log(requestUrl);

      try {
        var response = await httpClient.get(Uri.parse(requestUrl));

        if (response.statusCode == 200) {
          var jsonResponse = json.decode(response.body);
          jsonResponse = jsonResponse['response'];
          jsonResponse = jsonResponse['body'];
          jsonResponse = jsonResponse['items'];
          jsonResponse = jsonResponse['item'];

          WeatherModel weatherModel = WeatherModel.fromJsonList(jsonResponse);
          return weatherModel;
        }
      } catch (e) {
        log(e.toString());
      }
    } else {}
  }
}
