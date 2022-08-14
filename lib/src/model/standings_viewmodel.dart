class StandingsViewModel {
  int? id;
  int? season;
  String? sort;

  StandingsViewModel({this.id, this.season, this.sort});

  StandingsViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    season = json['season'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['season'] = season;
    data['sort'] = sort;
    return data;
  }
}
