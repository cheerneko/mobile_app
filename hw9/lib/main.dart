import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imagesList = [
    "images/stayc.jpg",
    "images/newjeans.jpg",
    "images/redvelvet.jpg",
    "images/ive.jpg",
    "images/taeyeon.jpg"
  ];
  
  List<String> nameList =[
    "STAYC(스테이씨) '색안경 STEREOTYPE' MV.mp4",
    "NewJeans (뉴진스) 'OMG' Official MV.mp4",
    "Red Velvet 레드벨벳 'Feel My Rhythm' MV.mp4",
    "IVE 아이브 'After LIKE' MV.mp4",
    "TAEYEON 태연 'What Do I Call You'.mp4"
  ];

  List<String> timeList =[
    "3 hours ago",
    "1 month ago",
    "6 months ago",
    "3 years ago",
    "5 years ago"
  ];

  List<String> clipList =[
    "videos/clip1.mp4",
    "videos/clip2.mp4",
    "videos/clip3.mp4",
    "videos/clip4.mp4",
    "videos/clip5.mp4"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("YouTube Demo"),
        backgroundColor: Color.fromARGB(255, 255, 171, 244)
      ),
      body: ListView.builder(
        itemCount: imagesList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child:
            Column(
            children: [
              Image.asset(imagesList[index]),
              Row(
                children: [
                  const Icon(Icons.account_circle),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nameList[index]),
                      Row(
                        children: [
                          Text("Username  "),
                          Text(timeList[index])
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ) ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => VideoPlayerScreenState(title: nameList[index], video: clipList[index])));
            },
          );
          
  },
)
, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VideoPlayerScreenState extends StatefulWidget {
  const VideoPlayerScreenState({super.key, required this.title, required this.video});
  final String title;
  final String video;

  @override
  State<VideoPlayerScreenState> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreenState> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(widget.title),
          ),
          backgroundColor: Color.fromARGB(255, 255, 171, 244),
        ),
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ));
  }
}

