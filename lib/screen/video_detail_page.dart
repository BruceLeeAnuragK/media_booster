import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/VideoProvider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
        title: Text(
          "The Video Player",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<VideoProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              AspectRatio(
                aspectRatio: provider.videoPlayerController.value.aspectRatio,
                child: Chewie(controller: provider.chewieController),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 500,
                child: ListView.separated(
                  itemBuilder: (context, index) => Card(
                    color: Colors.green,
                    child: ListTile(
                      onTap: () {
                        provider.changeIndex(index: index);
                        Navigator.of(context).pushNamed("video_screen");
                      },
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(
                          provider.VideosImage[index],
                        ),
                      ),
                      title: Text(
                        provider.VideosName[index].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Column(),
                  itemCount: provider.Video.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
