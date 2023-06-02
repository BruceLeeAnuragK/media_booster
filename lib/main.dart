import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/main.dart';
import 'package:media_booster/provider/media_booster_provider.dart';
import 'package:media_booster/screen/audio_screen.dart';
import 'package:media_booster/screen/video_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioProvider(),
        ),
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
    Provider.of<AudioProvider>(context).Vopen();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "The Media Booster",
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 30,
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
        body: Consumer<AudioProvider>(
          builder: (context, provider, child) => const TabBarView(
            children: [
              AudioScreen(),
              VideoScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
