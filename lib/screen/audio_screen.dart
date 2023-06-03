import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/media_booster_provider.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AudioProvider>(context).Vopen();
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: AudioProvider.myPlayer.currentPosition,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                Duration? data = snapshot.data;
                double max = AudioProvider
                        .myPlayer.current.value?.audio.duration.inSeconds
                        .toDouble() ??
                    Duration.zero.inSeconds.toDouble();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Slider(
                        min: 0,
                        max: max,
                        value: data!.inSeconds.toDouble(),
                        onChanged: (value) =>
                            Provider.of<AudioProvider>(context, listen: false)
                                .seekSong(value.toInt()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snapshot.data.toString().split(".").first),
                          Text(
                              "${AudioProvider.myPlayer.current.value?.audio.duration.toString().split(".").first}")
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Provider.of<AudioProvider>(context,
                                    listen: false)
                                .playSong(),
                            icon: Icon(Icons.play_arrow),
                          ),
                          IconButton(
                            onPressed: () => Provider.of<AudioProvider>(context,
                                    listen: false)
                                .pause(),
                            icon: Icon(Icons.pause),
                          ),
                          IconButton(
                            onPressed: () => Provider.of<AudioProvider>(context,
                                    listen: false)
                                .stop(),
                            icon: Icon(Icons.stop),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
