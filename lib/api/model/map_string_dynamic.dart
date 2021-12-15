class MapStringDynamic {
  final Map<String, dynamic> data;

  MapStringDynamic(this.data);

  factory MapStringDynamic.fromJson(Map<String, dynamic> json) {
    return MapStringDynamic(json);
  }

  Map<String, dynamic> toJson() => data;
}