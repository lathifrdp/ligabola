class StandingsStats {
  String? name;
  String? displayName;
  String? shortDisplayName;
  String? description;
  String? abbreviation;
  String? type;
  int? value;
  String? displayValue;

  StandingsStats({
    this.name,
    this.displayName,
    this.shortDisplayName,
    this.description,
    this.abbreviation,
    this.type,
    this.value,
    this.displayValue,
  });
  StandingsStats.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    displayName = json['displayName']?.toString();
    shortDisplayName = json['shortDisplayName']?.toString();
    description = json['description']?.toString();
    abbreviation = json['abbreviation']?.toString();
    type = json['type']?.toString();
    value = json['value']?.toInt();
    displayValue = json['displayValue']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['displayName'] = displayName;
    data['shortDisplayName'] = shortDisplayName;
    data['description'] = description;
    data['abbreviation'] = abbreviation;
    data['type'] = type;
    data['value'] = value;
    data['displayValue'] = displayValue;
    return data;
  }
}

class StandingsNote {
  String? color;
  String? description;
  int? rank;

  StandingsNote({
    this.color,
    this.description,
    this.rank,
  });
  StandingsNote.fromJson(Map<String, dynamic> json) {
    color = json['color']?.toString();
    description = json['description']?.toString();
    rank = json['rank']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    data['description'] = description;
    data['rank'] = rank;
    return data;
  }
}

class StandingsTeamLogos {
  String? href;
  int? width;
  int? height;
  String? alt;
  List<String?>? rel;
  String? lastUpdated;

  StandingsTeamLogos({
    this.href,
    this.width,
    this.height,
    this.alt,
    this.rel,
    this.lastUpdated,
  });
  StandingsTeamLogos.fromJson(Map<String, dynamic> json) {
    href = json['href']?.toString();
    width = json['width']?.toInt();
    height = json['height']?.toInt();
    alt = json['alt']?.toString();
    if (json['rel'] != null) {
      final v = json['rel'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      rel = arr0;
    }
    lastUpdated = json['lastUpdated']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['href'] = href;
    data['width'] = width;
    data['height'] = height;
    data['alt'] = alt;
    if (rel != null) {
      final v = rel;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['rel'] = arr0;
    }
    data['lastUpdated'] = lastUpdated;
    return data;
  }
}

class StandingsTeam {
  String? id;
  String? uid;
  String? location;
  String? name;
  String? abbreviation;
  String? displayName;
  String? shortDisplayName;
  bool? isActive;
  List<StandingsTeamLogos?>? logos;

  StandingsTeam({
    this.id,
    this.uid,
    this.location,
    this.name,
    this.abbreviation,
    this.displayName,
    this.shortDisplayName,
    this.isActive,
    this.logos,
  });
  StandingsTeam.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    uid = json['uid']?.toString();
    location = json['location']?.toString();
    name = json['name']?.toString();
    abbreviation = json['abbreviation']?.toString();
    displayName = json['displayName']?.toString();
    shortDisplayName = json['shortDisplayName']?.toString();
    isActive = json['isActive'];
    if (json['logos'] != null) {
      final v = json['logos'];
      final arr0 = <StandingsTeamLogos>[];
      v.forEach((v) {
        arr0.add(StandingsTeamLogos.fromJson(v));
      });
      logos = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['location'] = location;
    data['name'] = name;
    data['abbreviation'] = abbreviation;
    data['displayName'] = displayName;
    data['shortDisplayName'] = shortDisplayName;
    data['isActive'] = isActive;
    if (logos != null) {
      final v = logos;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['logos'] = arr0;
    }
    return data;
  }
}

class Standings {
  StandingsTeam? team;
  StandingsNote? note;
  List<StandingsStats>? stats;

  Standings({
    this.team,
    this.note,
    this.stats,
  });
  Standings.fromJson(Map<String, dynamic> json) {
    team = (json['team'] != null) ? StandingsTeam.fromJson(json['team']) : null;
    note = (json['note'] != null) ? StandingsNote.fromJson(json['note']) : null;
    if (json['stats'] != null) {
      final v = json['stats'];
      final arr0 = <StandingsStats>[];
      v.forEach((v) {
        arr0.add(StandingsStats.fromJson(v));
      });
      stats = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (note != null) {
      data['note'] = note!.toJson();
    }
    if (stats != null) {
      final v = stats;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['stats'] = arr0;
    }
    return data;
  }
}

class StandingsSeason {
  String? name;
  String? abbreviation;
  String? seasonDisplay;
  int? season;
  List<Standings>? standings;

  StandingsSeason({
    this.name,
    this.abbreviation,
    this.seasonDisplay,
    this.season,
    this.standings,
  });
  StandingsSeason.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    abbreviation = json['abbreviation']?.toString();
    seasonDisplay = json['seasonDisplay']?.toString();
    season = json['season']?.toInt();
    if (json['standings'] != null) {
      final v = json['standings'];
      final arr0 = <Standings>[];
      v.forEach((v) {
        arr0.add(Standings.fromJson(v));
      });
      standings = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['abbreviation'] = abbreviation;
    data['seasonDisplay'] = seasonDisplay;
    data['season'] = season;
    if (standings != null) {
      final v = standings;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['standings'] = arr0;
    }
    return data;
  }
}

class StandingsResponse {
  bool? status;
  StandingsSeason? data;

  StandingsResponse({
    this.status,
    this.data,
  });
  StandingsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =
        (json['data'] != null) ? StandingsSeason.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data!.toJson();
    return data;
  }
}
