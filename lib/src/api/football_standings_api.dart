import 'package:dio/dio.dart';
import 'package:liga_bola/src/helper/constant.dart';
import 'package:liga_bola/src/model/leagues.dart';
import 'package:liga_bola/src/model/standings.dart';
import 'package:liga_bola/src/model/standings_viewmodel.dart';

class FootballStandingsApi {
  Dio dio = Dio();
  late Response response;

  //Start: List Liga
  Future<LeaguesResponse> getListLiga() async {
    try {
      response = await dio.get(
        "${baseUrl}leagues",
      );
      var responseData = response.data;
      LeaguesResponse result = LeaguesResponse.fromJson(responseData);
      return result;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        int? statusCode = e.response!.statusCode;
        if (statusCode == 500) {
          throw "Maaf, sedang terjadi gangguan";
        }
        throw e.error.toString();
      }
      throw e.error.toString();
    }
  }
  //End: List Liga

  //Start: List Klasemen
  Future<StandingsResponse> getListKlasemen(
      StandingsViewModel viewModel) async {
    try {
      response = await dio.get("${baseUrl}leagues/${viewModel.id}/standings",
          queryParameters: {
            "season": viewModel.season,
            "sort": viewModel.sort
          });
      var responseData = response.data;
      StandingsResponse result = StandingsResponse.fromJson(responseData);
      return result;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        int? statusCode = e.response!.statusCode;
        if (statusCode == 500) {
          throw "Maaf, sedang terjadi gangguan";
        }
        throw e.error.toString();
      }
      throw e.error.toString();
    }
  }
  //End: List Klasemen
}
