// To parse this JSON data, do
//
//     final championModel = championModelFromJson(jsonString);

part of 'model.dart';
List<ChampionModel> championModelFromJson(String str) => List<ChampionModel>.from(json.decode(str).map((x) => ChampionModel.fromJson(x)));
List<ChampionModel> championModelFromMapList(List<Map<String, dynamic>> list) => List<ChampionModel>.from(list.map((x) => ChampionModel.fromJson(x)));

String championModelToJson(List<ChampionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChampionModel {
    final String version;
    final String id;
    final String key;
    final String name;
    final String title;
    final String blurb;
    final Info info;
    final Image image;
    final List<String> tags;
    final String partype;
    final Map<String, double> stats;

    ChampionModel({
        required this.version,
        required this.id,
        required this.key,
        required this.name,
        required this.title,
        required this.blurb,
        required this.info,
        required this.image,
        required this.tags,
        required this.partype,
        required this.stats,
    });

    ChampionModel copyWith({
        String? version,
        String? id,
        String? key,
        String? name,
        String? title,
        String? blurb,
        Info? info,
        Image? image,
        List<String>? tags,
        String? partype,
        Map<String, double>? stats,
    }) => 
        ChampionModel(
            version: version ?? this.version,
            id: id ?? this.id,
            key: key ?? this.key,
            name: name ?? this.name,
            title: title ?? this.title,
            blurb: blurb ?? this.blurb,
            info: info ?? this.info,
            image: image ?? this.image,
            tags: tags ?? this.tags,
            partype: partype ?? this.partype,
            stats: stats ?? this.stats,
        );

    factory ChampionModel.fromJson(Map<String, dynamic> json) => ChampionModel(
        version: json["version"],
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        blurb: json["blurb"],
        info: Info.fromJson(json["info"]),
        image: Image.fromJson(json["image"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        partype: json["partype"],
        stats: Map.from(json["stats"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "id": id,
        "key": key,
        "name": name,
        "title": title,
        "blurb": blurb,
        "info": info.toJson(),
        "image": image.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "partype": partype,
        "stats": Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Image {
    final String full;
    final String sprite;
    final String group;
    final int x;
    final int y;
    final int w;
    final int h;

    Image({
        required this.full,
        required this.sprite,
        required this.group,
        required this.x,
        required this.y,
        required this.w,
        required this.h,
    });

    Image copyWith({
        String? full,
        String? sprite,
        String? group,
        int? x,
        int? y,
        int? w,
        int? h,
    }) => 
        Image(
            full: full ?? this.full,
            sprite: sprite ?? this.sprite,
            group: group ?? this.group,
            x: x ?? this.x,
            y: y ?? this.y,
            w: w ?? this.w,
            h: h ?? this.h,
        );

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        full: json["full"],
        sprite: json["sprite"],
        group: json["group"],
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
    );

    Map<String, dynamic> toJson() => {
        "full": full,
        "sprite": sprite,
        "group": group,
        "x": x,
        "y": y,
        "w": w,
        "h": h,
    };
}

class Info {
    final int attack;
    final int defense;
    final int magic;
    final int difficulty;

    Info({
        required this.attack,
        required this.defense,
        required this.magic,
        required this.difficulty,
    });

    Info copyWith({
        int? attack,
        int? defense,
        int? magic,
        int? difficulty,
    }) => 
        Info(
            attack: attack ?? this.attack,
            defense: defense ?? this.defense,
            magic: magic ?? this.magic,
            difficulty: difficulty ?? this.difficulty,
        );

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        attack: json["attack"],
        defense: json["defense"],
        magic: json["magic"],
        difficulty: json["difficulty"],
    );

    Map<String, dynamic> toJson() => {
        "attack": attack,
        "defense": defense,
        "magic": magic,
        "difficulty": difficulty,
    };
}
