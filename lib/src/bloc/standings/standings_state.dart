part of 'standings_bloc.dart';

@immutable
abstract class StandingsState {}

class StandingsInitial extends StandingsState {}

class GetStandingsListSuccess extends StandingsState {
  final StandingsResponse response;
  GetStandingsListSuccess(this.response);
}

class GetStandingsListError extends StandingsState {
  final String? errorMessage;
  GetStandingsListError({this.errorMessage});
}

class GetStandingsListWaiting extends StandingsState {}
