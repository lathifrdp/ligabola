class LeaguesResponse {
  bool? status;
  List<Leagues>? data;

  LeaguesResponse({
    this.status,
    this.data,
  });
  LeaguesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <Leagues>[];
      v.forEach((v) {
        arr0.add(Leagues.fromJson(v));
      });
      data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['data'] = arr0;
    }
    return data;
  }
}

class Leagues {
  String? id;
  String? name;
  String? slug;
  String? abbr;
  LeaguesDataLogos? logos;

  Leagues({
    this.id,
    this.name,
    this.slug,
    this.abbr,
    this.logos,
  });
  Leagues.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    abbr = json['abbr']?.toString();
    logos = (json['logos'] != null)
        ? LeaguesDataLogos.fromJson(json['logos'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['abbr'] = abbr;
    if (logos != null) {
      data['logos'] = logos!.toJson();
    }
    return data;
  }
}

class LeaguesDataLogos {
  String? light;
  String? dark;

  LeaguesDataLogos({
    this.light,
    this.dark,
  });
  LeaguesDataLogos.fromJson(Map<String, dynamic> json) {
    light = json['light']?.toString();
    dark = json['dark']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['light'] = light;
    data['dark'] = dark;
    return data;
  }
}
