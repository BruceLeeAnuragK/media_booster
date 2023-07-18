import 'package:flutter/material.dart';
import 'package:media_booster/provider/AudioProvider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, provider, child) => StreamBuilder(
          stream: provider.currrentPosition,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                itemCount: provider.Audios.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.green,
                  child: ListTile(
                    title: Text(
                      "${provider.AudioName[index]}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(provider.AudioImage[index]),
                    ),
                    onTap: () {
                      provider.changeIndex(index: index);
                      Navigator.of(context).pushNamed(
                        "song_detail_page",
                        arguments: index,
                      );
                    },
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
          }),
    );
  }
}
