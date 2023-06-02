import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/provider/media_booster_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AudioProvider>(context).Vopen();
    return Scaffold(
      body: Consumer<AudioProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Column(
            children: [
              Chewie(controller: provider.chewiecontroller),
            ],
          ),
        ),
      ),
    );
  }
}
