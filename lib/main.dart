import 'package:flutter/material.dart';
import 'package:media_booster/provider/AudioProvider.dart';
import 'package:media_booster/provider/VideoProvider.dart';
import 'package:media_booster/screen/media_booster.dart';
import 'package:media_booster/screen/song_detail_page.dart';
import 'package:media_booster/screen/splash_screen.dart';
import 'package:media_booster/screen/video_detail_page.dart';
import 'package:provider/provider.dart';

import 'components/audio_screen.dart';
import 'components/video_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AudioProvider()),
      ChangeNotifierProvider(create: (context) => VideoProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "splash_screen",
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        "splash_screen": (context) => IntroScreen(),
        "song_page": (context) => SongPage(),
        "video_page": (context) => VideoPlayer(),
        "/": (context) => MediaBooster(),
        "song_detail_page": (context) => SongDetailPage(),
        "video_screen": (context) => VideoScreen(),
      },
    );
  }
}
