// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:liga_bola/src/api/football_standings_api.dart';
import 'package:liga_bola/src/model/leagues.dart';
import 'package:meta/meta.dart';

part 'leagues_event.dart';
part 'leagues_state.dart';

class LeaguesBloc extends Bloc<LeaguesEvent, LeaguesState> {
  LeaguesBloc() : super(LeaguesInitial()) {
    on<GetLeaguesListRequest>((event, emit) async {
      await _getLeaguesList(emit);
    });
  }
}

Future<void> _getLeaguesList(Emitter<LeaguesState> emit) async {
  FootballStandingsApi api = FootballStandingsApi();
  emit(GetLeaguesListWaiting());
  try {
    LeaguesResponse data = await api.getListLiga();
    emit(GetLeaguesListSuccess(data));
  } catch (ex) {
    emit(GetLeaguesListError(errorMessage: ex.toString()));
  }
}
