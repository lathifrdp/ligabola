// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:liga_bola/src/api/football_standings_api.dart';
import 'package:liga_bola/src/model/standings.dart';
import 'package:liga_bola/src/model/standings_viewmodel.dart';
import 'package:meta/meta.dart';

part 'standings_event.dart';
part 'standings_state.dart';

class StandingsBloc extends Bloc<StandingsEvent, StandingsState> {
  StandingsBloc() : super(StandingsInitial()) {
    on<GetStandingsListRequest>((event, emit) async {
      await _getStandingsList(event.viewModel, emit);
    });
  }
}

Future<void> _getStandingsList(
    StandingsViewModel? viewModel, Emitter<StandingsState> emit) async {
  FootballStandingsApi api = FootballStandingsApi();
  emit(GetStandingsListWaiting());
  try {
    StandingsResponse data = await api.getListKlasemen(viewModel!);
    emit(GetStandingsListSuccess(data));
  } catch (ex) {
    emit(GetStandingsListError(errorMessage: ex.toString()));
  }
}
