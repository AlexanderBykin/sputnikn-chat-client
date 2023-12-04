class MapStringDynamic {
  MapStringDynamic(this.data);

  factory MapStringDynamic.fromJson(Map<String, dynamic> json) {
    return MapStringDynamic(json);
  }

  final Map<String, dynamic> data;

  Map<String, dynamic> toJson() => data;
}
