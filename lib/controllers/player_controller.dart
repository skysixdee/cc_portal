import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sm_admin_portal/reusable_view/custom_audio_player.dart';

class PlayerController extends GetxController {
  RxString playingToneId = '-1'.obs;
  RxBool _isPlaying = false.obs;
  //late TuneInfo info;
  String toneId = '';
  playUrl(String toneid, String toneUrl) async {
    print("playing tone id = ${toneid}");
    this.toneId = toneid;
    if (playingToneId.value == (toneid)) {
      if (_isPlaying.value) {
        await pause();
      } else {
        await resume();
      }
    } else {
      await CustomAudioPlayer.instance.playUrl(toneUrl, (player) {
        _playerState(player);
      }, () async {
        await stop();
        return;
      });

      await play();
      //tunePlayClickEvent(info);
    }
  }

  Future<void> pause() async {
    print("paused tapped");

    await CustomAudioPlayer.instance.pause();
  }

  Future<void> playPause() async {
    if (_isPlaying.value) {
      pause();
    } else {
      play();
    }
  }

  Future<void> play() async {
    print(" play called");
    await CustomAudioPlayer.instance.play();
  }

  Future<void> resume() async {
    print("Resume called");
    await CustomAudioPlayer.instance.resume();
  }

  Future<void> stop() async {
    print("Stop called");
    await CustomAudioPlayer.instance.stop();
    playingToneId.value = '';
  }

  _playerState(AudioPlayer player) async {
    player.playerStateStream.listen((state) {
      if (state.playing) {
        switch (state.processingState) {
          case ProcessingState.idle:
            print("idle  =SKY==  ProcessingState.idle   ");

            break;
          case ProcessingState.loading:
            print("loading  =SKY==  ProcessingState.loading   ");

            break;
          case ProcessingState.buffering:
            print("buffering  =SKY==  ProcessingState.buffering   ");

            break;
          case ProcessingState.ready:
            print("ready  =SKY==  ProcessingState.ready   ");
            _isPlaying.value = true;
            playingToneId.value = toneId;
            break;
          case ProcessingState.completed:
            print("completed  =SKY==  ProcessingState.completed   ");
            playingToneId.value = '';
            break;
        }
      } else {
        print("Player is not playing");
        _isPlaying.value = false;
        playingToneId.value = '';
      }
    });
  }
}
