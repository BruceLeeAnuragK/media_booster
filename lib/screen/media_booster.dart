import 'package:flutter/material.dart';

import '../components/audio_screen.dart';
import '../components/video_screen.dart';

class MediaBooster extends StatefulWidget {
  const MediaBooster({Key? key}) : super(key: key);

  @override
  State<MediaBooster> createState() => _MediaBoosterState();
}

class _MediaBoosterState extends State<MediaBooster>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "The Media Booster",
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.lightGreen,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.audio_file,
                  size: 30,
                  color: Colors.lightGreen,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.video_collection_sharp,
                  size: 30,
                  color: Colors.lightGreen,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SongPage(),
            VideoPlayer(),
          ],
        ),
      ),
    );
  }
}
