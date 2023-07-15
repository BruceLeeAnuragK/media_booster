import 'package:flutter/material.dart';
import 'package:media_booster/provider/VideoProvider.dart';
import 'package:provider/provider.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(
      builder: (context, pro, child) => Center(
        child: pro.videoPlayerController.value.isInitialized
            ? ListView.separated(
                itemBuilder: (context, index) => Card(
                  color: Colors.green,
                  child: ListTile(
                    onTap: () {
                      pro.changeIndex(index: index);
                      Navigator.of(context).pushNamed("video_screen");
                    },
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(
                        pro.VideosImage[index],
                      ),
                    ),
                    title: Text(
                      pro.VideosName[index].toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Column(),
                itemCount: pro.Video.length,
              )
            : const CircularProgressIndicator(color: Colors.green),
      ),
    );
  }
}
