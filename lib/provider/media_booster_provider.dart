import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:media_booster/screen/audio_screen.dart';
import 'package:video_player/video_player.dart';

import '../screen/video_screen.dart';

class AudioProvider extends ChangeNotifier {
  static AssetsAudioPlayer myPlayer = AssetsAudioPlayer();

  open() async {
    await myPlayer.open(
      Audio("assets/audio/"),
    );
  }

  playSong() async {
    await myPlayer.play();
    notifyListeners();
  }

  pause() async {
    myPlayer.pause();
    notifyListeners();
  }

  stop() async {
    myPlayer.stop();
    notifyListeners();
  }

  seekSong(int second) async {
    await myPlayer.seekBy(Duration(seconds: second));
  }

  late ChewieController chewiecontroller;
  late VideoPlayerController controller;
  Vopen() {
    controller = VideoPlayerController.network("")
      ..initialize().then((_) {
        print("url :  ${controller.value}");
      });
    chewiecontroller = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: true,
    );
  }
}
