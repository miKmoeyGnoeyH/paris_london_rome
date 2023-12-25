import 'dart:math';

import 'package:paris_london_rome/app/data/model/latlng_model.dart';

const double RE = 6371.00877; // 지구 반경
const double GRID = 5.0; // 격자 간격(km)
const double SLAT1 = 30.0; // 투영 위도1(degree)
const double SLAT2 = 60.0; // 투영 위도2(degree)
const double OLON = 126.0; // 기준점 경도(degree)
const double OLAT = 38.0; // 기준점 위도(degree)
const double OX = 43; // 기준점 X좌표(GRID);
const double OY = 136; // 기준점 Y좌표(GRID);

const double DEGRAD = pi / 180.0;

class XYModel {
  late final int x;
  late final int y;

  XYModel.fromLatLng({required LatLngModel latLng}) {
    double re = RE / GRID;
    double slat1 = SLAT1 * DEGRAD;
    double slat2 = SLAT2 * DEGRAD;
    double olon = OLON * DEGRAD;
    double olat = OLAT * DEGRAD;

    double sn = tan(pi * 0.25 + slat2 * 0.5) / tan(pi * 0.25 + slat1 * 0.5);
    sn = log(cos(slat1) / cos(slat2)) / log(sn);

    double sf = tan(pi * 0.25 + slat1 * 0.5);
    sf = pow(sf, sn) * cos(slat1) / sn;

    double ro = tan(pi * 0.25 + olat * 0.5);
    ro = re * sf / pow(ro, sn);

    double ra = tan(pi * 0.25 + latLng.latitude! * DEGRAD * 0.5);
    ra = re * sf / pow(ra, sn);

    double theta = latLng.longitude! * DEGRAD - olon;

    if(theta > pi) theta -= 2.0 * pi;
    if(theta < -1 * pi) theta += 2.0 * pi;
    theta *= sn;

    x = (ra * sin(theta) + OX + 0.5).floor();
    y = (ro - ra * cos(theta) + OY + 0.5).floor();
  }
}