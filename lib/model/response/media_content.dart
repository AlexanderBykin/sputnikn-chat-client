class MediaContent {
  const MediaContent({
    required this.contentType,
    required this.bytes,
  });

  final String? contentType;
  final List<int> bytes;
}
