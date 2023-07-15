import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class AudioProvider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration totalDuration = Duration.zero;

  List AudioImage = [
    "https://pagalnew.com/coverimages/Baarishon-Ki-Dhun-Sanjeev-Chaturvedi-500-500.jpg",
    "https://pagalnew.com/coverimages/Teraa-Meraa-Rishta-Salman-Ali-500-500.jpg",
    "https://pagalnew.com/coverimages/Jabb-Se-Tumko-Dekhaa-Stebin-Ben-500-500.jpg",
    "https://pagalnew.com/coverimages/Pehli-Pehli-Baar-Sanjeev-Chaturvedi-500-500.jpg",
    "https://pagalnew.com/coverimages/Baarish-Karde-Swasti-Mehul-500-500.jpg",
    "https://pagalnew.com/coverimages/sach-bata-mujhe-industry-2-500-500.jpg",
    "https://pagalnew.com/coverimages/Krishna-Teri-Ho-Gyi-Jaani-500-500.jpg",
    "https://pagalnew.com/coverimages/Tere-Bin-Nihal-Tauro-500-500.jpg",
    "https://pagalnew.com/coverimages/Mohabbat-Amaal-Mallik-500-500.jpg",
    "https://pagalnew.com/coverimages/Pehli-Baarish-Mein-Jubin-Nautiyal-500-500.jpg",
    "https://pagalnew.com/coverimages/Dil-Ko-Sukoon-Tony-Kakkar-500-500.jpg",
    "https://pagalworld.video/siteuploads/thumb/sft3/1365_resize_320x180.webp",
  ];
  List Audios = [
    "assets/audio/Baarishon_Ki_Dhun.mp3",
    "assets/audio/Teraa_Meraa_Rishta.mp3",
    "assets/audio/Jabb_Se_Tumko_Dekhaa.mp3",
    "assets/audio/Pehli_Pehli_Baar.mp3",
    "assets/audio/Baarish_Karde.mp3",
    "assets/audio/Sach_Bata_Mujhe.mp3",
    "assets/audio/Krishna_Teri_Ho_Gyi.mp3",
    "assets/audio/Tere_Bin_Nihal.mp3",
    "assets/audio/Mohabbat.mp3",
    "assets/audio/Pehli_Baarish_Mein.mp3",
    "assets/audio/Dil_Ko_Sukoon.mp3",
    "assets/audio/Tu_Meraa_Raja.mp3",
  ];
  List AudioName = [
    "Barrishon_Ki_Dhun.mp3",
    "Teraa_Meraa_Rishta.mp3",
    "Jabb_Se_Tumko_Dekhaa.mp3",
    "Pehli_Pehli_Baar.mp3",
    "Baarish_Karde.mp3",
    "Sach_Bata_Mujhe.mp3",
    "Krishna_Teri_Ho_Gyi.mp3",
    "Tere_Bin_Nihal.mp3",
    "Mohabbat.mp3",
    "Pehli_Baarish_Mein.mp3",
    "Dil_Ko_Sukoon.mp3",
    "Tu_Meraa_Raja.mp3",
  ];

  changeIndex({required int index}) {
    assetsAudioPlayer.pause();
    notifyListeners();
    init(index: index);
  }

  AudioProvider() {
    init(index: 0);
  }

  init({required int index}) {
    assetsAudioPlayer
        .open(Audio(Audios[index]), autoStart: false, showNotification: true)
        .then((value) {
      totalDuration = assetsAudioPlayer.current.value!.audio.duration;
      print("DONE>>>>>>>>>>>>>>>>>>>>>>>>>");
    });
  }

  play() async {
    await assetsAudioPlayer.play();
    notifyListeners();
  }

  pause() async {
    await assetsAudioPlayer.pause();
    notifyListeners();
  }

  seek({required int seconds}) async {
    await assetsAudioPlayer.seek(Duration(seconds: seconds));
    notifyListeners();
  }

  skip({required int seconds}) async {
    await assetsAudioPlayer.seekBy(Duration(seconds: seconds));
    notifyListeners();
  }

  get isPlaying {
    return assetsAudioPlayer.isPlaying.value;
  }

  get currrentPosition {
    return assetsAudioPlayer.currentPosition;
  }
}
