import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

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
    fetchAndPlayAudio();
    audioPlayer.positionStream.listen((pos) => position.value = pos);
    audioPlayer.durationStream.listen((dur) => duration.value = dur);
    audioPlayer.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
      if (state.processingState == ProcessingState.completed) {
        // Handle end of playback
      }
    });
  }

  Future<void> fetchAndPlayAudio() async {
    try {
      isLoading.value = true;

      // 🔁 MOCK API - Replace with your actual HTTP request
      await Future.delayed(Duration(seconds: 1)); // simulate API delay
      final String audioUrl = 'https://example.com/audio.mp3';
      audioTitle.value = 'Grief Ritual - Breathe Into Loss';
      audioArtist.value = 'Voice By Daissy';

      await audioPlayer.setUrl(audioUrl);
      audioPlayer.play();
    } catch (e) {
      print("Error loading audio: $e");
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
    audioPlayer.dispose();
    super.onClose();
  }
}
