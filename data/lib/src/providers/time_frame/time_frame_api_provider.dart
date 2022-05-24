import 'dart:io';

import 'package:domain/domain.dart';

import '../../../data.dart';
import '../../api/dio_http_client/dio_http_client.dart';
import '../../dto/time_frame/time_frame_list_dto.dart';
import '../../mappers/time_frame/time_frame_mappers.dart';
import 'time_frame_provider.dart';

class TimeFrameApiProvider implements TimeFrameProvider {
  static const String _BASE_URL = 'https://wookie.codesubmit.io';
  static const String _TIME_TRACKING = '/time-tracking';
  final Dio _client = dioHttpClient(_BASE_URL);
  final Options _options = Options(headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });

  @override
  Future<TimeFrameList> getTimeTracking() async {
    try {
      final response = await _client.get(
        _TIME_TRACKING,
        options: _options,
      );
      final timeFrameListDTO = TimeFrameListDTO.fromJson(response.data);
      return mapTimeFrameListDtoToTimeFrameList(timeFrameListDTO);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
