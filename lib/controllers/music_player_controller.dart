import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../models/audio_model.dart';

class MusicPlayerController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();

  var isLoading = true.obs;
  var isPlaying = false.obs;
  var duration = Rxn<Duration>();
  var position = Duration.zero.obs;
  var audioTitle = ''.obs;
  var audioArtist = ''.obs;

  @override
  void onInit() {
    super.onInit();
    audioPlayer.positionStream.listen((pos) => position.value = pos);
    audioPlayer.durationStream.listen((dur) => duration.value = dur);

    audioPlayer.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });
  }

  Future<void> fetchAndPlayAudio(String moodTitle) async {
    try {
      isLoading.value = true;

      final String response =
      await rootBundle.loadString('assets/mock_data/audio_info.json');
      final Map<String, dynamic> data = json.decode(response);

      if (!data.containsKey(moodTitle)) {
        throw Exception("No audio found for $moodTitle");
      }

      final audioInfo = AudioInfo.fromJson(data[moodTitle]);

      audioArtist.value = audioInfo.artist;

      await audioPlayer.setUrl(audioInfo.url);
      audioPlayer.play();
    } catch (e) {
      print("Error fetching/playing audio: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void playPause() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  void skipForward() {
    final newPosition = audioPlayer.position + const Duration(seconds: 10);
    final total = audioPlayer.duration ?? Duration.zero;
    audioPlayer.seek(newPosition < total ? newPosition : total);
  }

  void skipBackward() {
    final newPosition = audioPlayer.position - const Duration(seconds: 10);
    audioPlayer.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void onClose() {
    audioPlayer.pause();
    audioPlayer.dispose();
    super.onClose();
  }
}
