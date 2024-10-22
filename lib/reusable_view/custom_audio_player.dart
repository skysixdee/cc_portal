import 'package:just_audio/just_audio.dart';
import 'package:cc_portal/reusable_view/sm_snack_bar.dart';

class CustomAudioPlayer {
  static final CustomAudioPlayer instance = CustomAudioPlayer._internal();
  late AudioPlayer _player;
  CustomAudioPlayer._internal() {
    print("initialize MtnAudioPlayer");
    _player = AudioPlayer();
  }
  factory CustomAudioPlayer() {
    return instance;
  }

  Future<void> playUrl(
      String url, Function(AudioPlayer player) action, Function() error) async {
    print("playing url is $url");
    await stop();
    action(_player);
    await stop();
    try {
      await _player.setUrl(url);
    } on PlayerException catch (e) {
      error();
      print("SKY Error code: ${e.code}");
      print("SKY Error message: ${e.message}");
      smSnackBar(e.message.toString());
    } on PlayerInterruptedException catch (e) {
      error();
      print("SKY Connection aborted: ${e.message}");
      smSnackBar(e.message.toString());
    } catch (e) {
      error();
      print('SKY An error occured: $e');
      smSnackBar(e.toString());
    }
  }

  playerSeek(Duration position) async {
    _player.seek(position);
  }

  Future<void> play() async {
    await _player.play();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> stop() async {
    await _player.stop();
  }

  Future<void> resume() async {
    await _player.play();
  }
}
