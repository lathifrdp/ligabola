part of 'leagues_bloc.dart';

@immutable
abstract class LeaguesState {}

class LeaguesInitial extends LeaguesState {}

class GetLeaguesListSuccess extends LeaguesState {
  final LeaguesResponse response;
  GetLeaguesListSuccess(this.response);
}

class GetLeaguesListError extends LeaguesState {
  final String? errorMessage;
  GetLeaguesListError({this.errorMessage});
}

class GetLeaguesListWaiting extends LeaguesState {}
