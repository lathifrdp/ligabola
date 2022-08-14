part of 'standings_bloc.dart';

@immutable
abstract class StandingsEvent {}

class GetStandingsListRequest extends StandingsEvent {
  final StandingsViewModel? viewModel;
  GetStandingsListRequest({this.viewModel});
}
