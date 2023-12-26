import 'dart:developer';

class WeatherModel {
   String? tmp;
   String? pop;
   String? sky;

  WeatherModel();

  WeatherModel.fromJsonList(List<dynamic> jsonList) {
    //log(jsonList.toString());
    for(var json in jsonList) {
      log(json.toString());
      switch(json['category']) {
        case 'TMP':
          tmp = json['fcstValue'];
          break;
        case 'POP':
          pop = json['fcstValue'];
          break;
        case 'SKY':
          sky = json['fcstValue'];
          break;
        default:
          continue;
      }
    }
  }
}