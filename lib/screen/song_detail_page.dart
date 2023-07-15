import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/AudioProvider.dart';

class SongDetailPage extends StatefulWidget {
  const SongDetailPage({Key? key}) : super(key: key);

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage>
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
    return Consumer<AudioProvider>(
      builder: (context, provider, child) => SafeArea(
        child: Scaffold(
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
              "The Audio Player",
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  child:
                      Image.network("${provider.AudioImage.indexOf(context)}"),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.green,
                    Colors.greenAccent,
                  ])),
                ),
                StreamBuilder(
                  stream: provider.assetsAudioPlayer.currentPosition,
                  builder: (context, AsyncSnapshot<Duration> snapShot) {
                    if (snapShot.hasData) {
                      double currentPosition =
                          snapShot.data!.inSeconds.toDouble();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Slider(
                                activeColor: Colors.green,
                                min: 0,
                                max:
                                    provider.totalDuration.inSeconds.toDouble(),
                                value: currentPosition,
                                onChanged: (val) {
                                  provider.seek(seconds: val.toInt());
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${snapShot.data!.inMinutes}:${(snapShot.data!.inSeconds) % 60}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${provider.totalDuration.inMinutes} :${(provider.totalDuration.inSeconds) % 60}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        provider.skip(seconds: -10);
                                      },
                                      icon: const Icon(
                                        Icons.skip_previous,
                                        color: Colors.green,
                                        size: 30,
                                      )),
                                ),
                                Expanded(
                                  child: StreamBuilder(
                                      stream:
                                          provider.assetsAudioPlayer.isPlaying,
                                      builder: (context,
                                          AsyncSnapshot<bool> snapShot) {
                                        // snapShot.data!
                                        //     ? animationController.forward()
                                        //     : animationController.reverse();

                                        return IconButton(
                                            onPressed: () {
                                              if (snapShot.data!) {
                                                provider.pause();
                                                animationController.reverse();
                                                setState(() {});
                                              } else {
                                                provider.play();
                                                animationController.forward();
                                                setState(() {});
                                              }
                                            },
                                            icon: AnimatedIcon(
                                              color: Colors.green,
                                              icon: AnimatedIcons.play_pause,
                                              progress: animationController,
                                              size: 30,
                                            ));
                                      }),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      provider.skip(seconds: 10);
                                    },
                                    icon: const Icon(
                                      Icons.skip_next,
                                      size: 30,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Container(
                  height: 500,
                  child: ListView.separated(
                    itemBuilder: (context, index) => Card(
                      color: Colors.green,
                      child: ListTile(
                        onTap: () {
                          provider.changeIndex(index: index);
                          Navigator.of(context).pushNamed("song_detail_page");
                        },
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                            provider.AudioImage[index],
                          ),
                        ),
                        title: Text(
                          provider.AudioName[index].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => Column(),
                    itemCount: provider.Audios.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
