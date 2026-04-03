import 'package:flutter/material.dart';
import 'package:youtubeclone/Models/colors.dart';
import 'package:youtubeclone/Models/textstyles.dart';
import 'package:youtubeclone/Views/channel_avatar.dart';
import 'package:youtubeclone/Views/suggestions_tab.dart';
import 'package:youtubeclone/Views/video_card.dart';

import 'Models/channel.dart';
import 'Models/video.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This trailing comma makes auto-formatting nicer for build methods.
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    child: Image(image: AssetImage("assets/youtube_logo.png")),
                  ),
                  Text("YouTube", style: youtube),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 100, bottom: 15),
              width: 260,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.cast),
                    Icon(Icons.video_call),
                    Icon(Icons.search),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: CircleAvatar(
                        backgroundImage: channel.profilePicture,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          backgroundColor: tabBarColor,
        ),
        body: TabBarView(
          children: [
            Container(
              color: backgroundColor,
              child: ListView(children: getVideos(false)),
            ),
            Container(color: Colors.orange),
            Container(
              color: backgroundColor,
              child: ListView(children: getVideos(true)),
            ),
            Container(color: Colors.red),
            Container(color: Colors.blue),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelStyle: tabTextStyle,
          tabs: tabList,
          labelColor: tabBarSelectedIconsColor,
          unselectedLabelColor: tabBarUnselectedIconsColor,
          indicatorColor: Colors.transparent,
        ),
        backgroundColor: tabBarColor,
      ),
    );
  }

  List<Widget> getVideos(bool isSubscriptionPage) {
    List<Video> videos = makeVideos();
    List<Widget> cards = [];
    if (isSubscriptionPage) {
      cards.add(
        Container(
          color: backgroundColor,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(children: <Widget>[ChannelAvatar(channel: channel)]),
              Divider(color: tabBarUnselectedIconsColor),
              SuggestionsTab(),
            ],
          ),
        ),
      );
    } else {
      cards.add(
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          color: backgroundColor,
          height: 50,
          child: SuggestionsTab(),
        ),
      );
    }
    for (Video video in videos) {
      cards.add(VideoCard(video: video));
    }
    return cards;
  }

  List<String> videoTitles = [
    "One Day Builds: YouTube Clone With FLutter!",
    "How To Get Started In Game Development",
    "I Practiced Touch Typing Every Day For 30 Days",
    "How To Overcome Coders Block",
    "Super Quick Python Porject Ideas For Beginners!",
  ];

  Channel channel = Channel(
    "Kalle Hallden",
    AssetImage("assets/profilepics/5.jpg"),
  );

  List<Video> makeVideos() {
    List<Video> vids = [];
    for (int i = 0; i < 5; i++) {
      vids.add(
        Video(
          AssetImage("assets/thumbnails/$i.jpg"),
          120000,
          DateTime.now().subtract(Duration(days: 400)),
          videoTitles[i],
          channel,
          0,
        ),
      ); // add "i"
    }
    return vids;
  }

  List<Widget> tabList = [
    Tab(icon: Icon(Icons.home), text: "Home"),
    Tab(icon: Icon(Icons.explore), text: "Explore"),
    Tab(icon: Icon(Icons.subscriptions), text: "Subscriptions"),
    Tab(icon: Icon(Icons.email), text: "Inbox"),
    Tab(icon: Icon(Icons.video_library), text: "Library"),
  ];
}
