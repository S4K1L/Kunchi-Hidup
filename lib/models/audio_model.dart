class AudioInfo {
  final String url;
  final String artist;

  AudioInfo({
    required this.url,
    required this.artist,
  });

  factory AudioInfo.fromJson(Map<String, dynamic> json) {
    return AudioInfo(
      url: json['url'],
      artist: json['artist'],
    );
  }
}
