 import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class AudioProvider extends ChangeNotifier{
  static AssetsAudioPlayer myPlayer = AssetsAudioPlayer();

   open()  async {
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
}