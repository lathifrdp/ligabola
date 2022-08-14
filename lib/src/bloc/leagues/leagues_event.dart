part of 'leagues_bloc.dart';

@immutable
abstract class LeaguesEvent {}

class GetLeaguesListRequest extends LeaguesEvent {
  GetLeaguesListRequest();
}
