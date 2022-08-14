// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liga_bola/src/bloc/standings/standings_bloc.dart';
import 'package:liga_bola/src/helper/theme_colors.dart';
import 'package:liga_bola/src/model/standings.dart';
import 'package:liga_bola/src/model/standings_viewmodel.dart';
import 'dart:io' show Platform;

class KlasemenPage extends StatefulWidget {
  const KlasemenPage({Key? key}) : super(key: key);

  @override
  State<KlasemenPage> createState() => _KlasemenPageState();
}

class _KlasemenPageState extends State<KlasemenPage> {
  StandingsResponse response = StandingsResponse();
  StandingsBloc standingsBloc = StandingsBloc();
  String? id;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as String;
    id = arguments;

    standingsBloc = BlocProvider.of<StandingsBloc>(context);
    StandingsViewModel viewModel = StandingsViewModel();
    viewModel.id = id;
    viewModel.season = id == "uga.1" ? 2021 : 2022;
    viewModel.sort = "asc";
    standingsBloc.add(GetStandingsListRequest(viewModel: viewModel));

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: hijauTua,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: BlocListener(
            bloc: standingsBloc,
            listener: (context, state) {
              if (state is GetStandingsListSuccess) {
                response = state.response;
              }
              if (state is GetStandingsListError) {
                print(state.errorMessage);
              }
            },
            child: BlocBuilder(
              bloc: standingsBloc,
              builder: (context, state) {
                if (state is GetStandingsListWaiting) {
                  return Center(
                    child: CircularProgressIndicator(color: whiteColor),
                  );
                }
                if (state is GetStandingsListError) {
                  return Center(
                    child: Text("${state.errorMessage}"),
                  );
                }
                if (state is GetStandingsListSuccess) {
                  return response.data != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Platform.isIOS
                                        ? Icons.arrow_back_ios_new_rounded
                                        : Icons.arrow_back_rounded,
                                    color: whiteColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${response.data!.name}",
                                        style: TextStyle(
                                            color: whiteColor, fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "${response.data!.seasonDisplay}",
                                        style: TextStyle(
                                            color: grayColor20,
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Club",
                                  style: TextStyle(
                                      fontSize: 12, color: grayColor20),
                                ),
                                const SizedBox(
                                  width: 125,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 28,
                                  child: Text(
                                    "GP",
                                    style: TextStyle(
                                        fontSize: 12, color: grayColor20),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 28,
                                  child: Text(
                                    "W",
                                    style: TextStyle(
                                        fontSize: 12, color: grayColor20),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 28,
                                  child: Text(
                                    "L",
                                    style: TextStyle(
                                        fontSize: 12, color: grayColor20),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 28,
                                  child: Text(
                                    "D",
                                    style: TextStyle(
                                        fontSize: 12, color: grayColor20),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 28,
                                  child: Text(
                                    "GD",
                                    style: TextStyle(
                                        fontSize: 12, color: grayColor20),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 28,
                                  child: Text(
                                    "P",
                                    style: TextStyle(
                                        fontSize: 12, color: grayColor20),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: response.data!.standings!.length,
                                    itemBuilder: (ctx, idx) {
                                      return content(
                                          response.data!.standings![idx],
                                          idx + 1);
                                    }),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                            "Tidak ada data",
                            style: TextStyle(color: grayColor70),
                          ),
                        );
                }
                return Container();
              },
            ),
          ),
        ),
      ],
    ));
  }

  Widget content(Standings e, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: grayColor30)),
      child: Row(
        children: [
          SizedBox(
            width: 155,
            child: Row(
              children: [
                Text("$index"),
                const SizedBox(
                  width: 8,
                ),
                e.team!.logos != null
                    ? Image.network(
                        "${e.team!.logos![0]!.href}",
                        scale: 14,
                      )
                    : CircleAvatar(
                        backgroundColor: grayColor30,
                        maxRadius: 16,
                      ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "${e.team!.name}",
                    style: TextStyle(fontSize: 12, color: grayColor70),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 28,
            child: Text(
              "${e.stats![3].value}",
              style: TextStyle(fontSize: 12, color: grayColor80),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 28,
            child: Text(
              "${e.stats![0].value}",
              style: TextStyle(fontSize: 12, color: grayColor80),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 28,
            child: Text(
              "${e.stats![1].value}",
              style: TextStyle(fontSize: 12, color: grayColor80),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 28,
            child: Text(
              "${e.stats![2].value}",
              style: TextStyle(fontSize: 12, color: grayColor80),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 28,
            child: Text(
              "${e.stats![9].value}",
              style: TextStyle(fontSize: 12, color: grayColor80),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 28,
            child: Text(
              "${e.stats![6].value}",
              style: TextStyle(
                  fontSize: 12,
                  color: grayColor80,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
