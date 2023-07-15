import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  List VideosImage = [
    "https://pagalworld.video/siteuploads/thumb/sft3/1408_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1407_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1405_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1378_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1403_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1401_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1400_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1362_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1366_resize_320x180.webp",
  ];
  List Video = [
    "assets/video/Raaton_Aditya.mp4",
    "assets/video/Sach_Bata_Mujhe.mp4",
    "assets/video/Dil_Se_Dil_Tak.mp4",
    "assets/video/Tumhe_Kitna_Pyar_Karte.mp4",
    "assets/video/Tu_Meri_Baarish_Hai.mp4",
    "assets/video/Gole_Male.mp4",
    "assets/video/Mere_Sanam_Ke_Khwaab.mp4",
    "assets/video/Bheegi_Bheegii.mp4",
    "assets/video/Baarishon_Ki_Dhun.mp4",
  ];
  List VideosName = [
    "Raaton_Aditya.mp4",
    "Sach_Bata_Mujhe.mp4",
    "Dil_Se_Dil_Tak.mp4",
    "Tumhe_Kitna_Pyar_Karte.mp4",
    "Tu_Meri_Baarish_Hai.mp4",
    "Gole_Male.mp4",
    "Mere_Sanam_Ke_Khwaab.mp4",
    "Bheegi_Bheegii.mp4",
    "Baarishon_Ki_Dhun.mp4",
  ];

  init({required int index}) {
    videoPlayerController = VideoPlayerController.asset(Video[index])
      ..initialize().then((value) {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: false,
          aspectRatio: videoPlayerController.value.aspectRatio,
        );
        notifyListeners();
      });
  }

  VideoProvider() {
    init(index: 0);
  }

  changeIndex({required int index}) {
    videoPlayerController.pause();
    chewieController.pause();
    notifyListeners();
    init(index: index);
  }

  play() async {
    await videoPlayerController.play();
    notifyListeners();
  }

  pause() async {
    await videoPlayerController.pause();
    notifyListeners();
  }
}
