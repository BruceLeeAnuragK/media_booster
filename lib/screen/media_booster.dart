import 'package:flutter/material.dart';
import 'package:media_booster/provider/media_booster_provider.dart';
import 'package:provider/provider.dart';

class MediaBooster extends StatefulWidget {
  const MediaBooster({Key? key}) : super(key: key);

  @override
  State<MediaBooster> createState() => _MediaBoosterState();
}

class _MediaBoosterState extends State<MediaBooster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Media Booster"),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.audio_file, size: 20, color: Colors.lightGreen,),
            ),
            Tab(
              icon: Icon(Icons.audio_file, size: 20, color: Colors.lightGreen,),
            ),
          ],
        ),

      ),
      body: Center(
        child: Column(
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
                           IconButton(onPressed: ()=> Provider.of<AudioProvider>(context, listen: false).playSong(), icon: Icon(Icons.play_arrow),),
                           IconButton(onPressed: ()=> Provider.of<AudioProvider>(context, listen: false).playSong(), icon: Icon(Icons.play_arrow),),

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
    );
  }
}
