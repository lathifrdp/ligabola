// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liga_bola/src/bloc/leagues/leagues_bloc.dart';
import 'package:liga_bola/src/helper/theme_colors.dart';
import 'package:liga_bola/src/model/leagues.dart';

class LigaPage extends StatefulWidget {
  const LigaPage({Key? key}) : super(key: key);

  @override
  State<LigaPage> createState() => _LigaPageState();
}

class _LigaPageState extends State<LigaPage> {
  LeaguesResponse response = LeaguesResponse();
  LeaguesBloc leaguesBloc = LeaguesBloc();

  @override
  void initState() {
    leaguesBloc = BlocProvider.of<LeaguesBloc>(context);
    leaguesBloc.add(GetLeaguesListRequest());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.sports_rounded,
                      size: 50,
                      color: whiteColor,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Liga Bola",
                          style: TextStyle(color: whiteColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Disini bola, disana bola",
                          style: TextStyle(
                              color: grayColor20,
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocListener(
                  bloc: leaguesBloc,
                  listener: (context, state) {
                    if (state is GetLeaguesListSuccess) {
                      response = state.response;
                    }
                    if (state is GetLeaguesListError) {
                      print(state.errorMessage);
                    }
                  },
                  child: BlocBuilder(
                    bloc: leaguesBloc,
                    builder: (context, state) {
                      if (state is GetLeaguesListWaiting) {
                        return Center(
                          child: CircularProgressIndicator(color: whiteColor),
                        );
                      }
                      if (state is GetLeaguesListError) {
                        return Center(
                          child: Text("${state.errorMessage}"),
                        );
                      }
                      if (state is GetLeaguesListSuccess) {
                        return response.data != null
                            ? Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: response.data!.length,
                                    itemBuilder: (ctx, idx) {
                                      return content(response.data![idx]);
                                    }),
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
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget content(Leagues e) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/klasemen', arguments: e.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: grayColor30)),
        child: Row(
          children: [
            Image.network(
              "${e.logos!.light}",
              scale: 14,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text("${e.name}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
