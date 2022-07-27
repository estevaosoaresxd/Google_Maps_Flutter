import 'package:dio/dio.dart';
import 'package:google_maps_api/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_api/.env.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections(
      {required LatLng origin, required LatLng destination}) async {
    final res = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleAPIKey
      },
    );

    if (res.statusCode == 200) {
      return Directions.fromMap(res.data);
    }

    return throw 'error';
  }
}
