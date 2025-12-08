import 'dart:convert';

class AlbumApi {
    int idalbum;
    String nomalbum;
    String descalbum;
    String artistealbum;
    bool groupealbum;
    String? pochettealbum;
    String compositeuralbum;
    String? linkyoualbum;
    String linkartistealbum;

    AlbumApi({
        required this.idalbum,
        required this.nomalbum,
        required this.descalbum,
        required this.artistealbum,
        required this.groupealbum,
        required this.pochettealbum,
        required this.compositeuralbum,
        required this.linkyoualbum,
        required this.linkartistealbum,
    });

    factory AlbumApi.fromRawJson(String str) => AlbumApi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AlbumApi.fromJson(Map<String, dynamic> json) => AlbumApi(
        idalbum: json["idalbum"],
        nomalbum: json["nomalbum"],
        descalbum: json["descalbum"],
        artistealbum: json["artistealbum"],
        groupealbum: json["groupealbum"],
        pochettealbum: json["pochettealbum"],
        compositeuralbum: json["compositeuralbum"],
        linkyoualbum: json["linkyoualbum"],
        linkartistealbum: json["linkartistealbum"],
    );

    Map<String, dynamic> toJson() => {
        "idalbum": idalbum,
        "nomalbum": nomalbum,
        "descalbum": descalbum,
        "artistealbum": artistealbum,
        "groupealbum": groupealbum,
        "pochettealbum": pochettealbum,
        "compositeuralbum": compositeuralbum,
        "linkyoualbum": linkyoualbum,
        "linkartistealbum": linkartistealbum,
    };
}
