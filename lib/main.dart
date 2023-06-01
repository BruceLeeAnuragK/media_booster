import 'package:flutter/material.dart';
import 'package:media_booster/main.dart';
import 'package:media_booster/provider/media_booster_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AudioProvider(), ),
  ],
    child: const MyApp(),
  ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("The Media Booster",style: TextStyle(
            color: Colors.lightGreen,
             fontSize: 30,
          ),),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.lightGreen,

            tabs: [
              Tab(
                icon: Icon(Icons.audio_file, size: 30, color: Colors.lightGreen,),
              ),
              Tab(
                icon: Icon(Icons.video_collection_sharp, size: 30, color: Colors.lightGreen,),
              ),
            ],
          ),

        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBarView(

                children: [
                  StreamBuilder(
                    stream: AudioProvider.myPlayer.currentPosition,
                    builder: (context, snapshot) {
                      if( snapshot.hasData) {
                        Duration? data = snapshot.data;
                        double max = AudioProvider.myPlayer.current.value?.audio
                            .duration.inSeconds.toDouble() ??
                            Duration.zero.inSeconds.toDouble();
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Slider(
                              min: 0,
                              max: max,
                              value: data!.inSeconds.toDouble(), onChanged: (value) =>
                                Provider.of<AudioProvider>(context, listen: false)
                                    .seekSong(value.toInt()),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(snapshot.data.toString().split(".").first),
                                Text("${AudioProvider.myPlayer.current.value?.audio.duration.toString().split(".").first}")
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: ()=> Provider.of<AudioProvider>(context, listen: false).playSong(), icon: Icon(Icons.play_arrow),),
                                IconButton(onPressed: ()=> Provider.of<AudioProvider>(context, listen: false).pause(), icon: Icon(Icons.pause),),
                                IconButton(onPressed: ()=> Provider.of<AudioProvider>(context, listen: false).stop(), icon: Icon(Icons.stop),),
                              ],
                            ),
                          ],
                        );
                      } else if(snapshot.hasError){
                        return Text(snapshot.error.toString());
                      }else {
                        return const Center( child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
