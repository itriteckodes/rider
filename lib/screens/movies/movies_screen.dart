import 'package:driver/api/watchlist_api.dart';
import 'package:driver/models/Video.dart';
import 'package:driver/screens/movies/video_card.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List _videos = [];

  @override
  void initState() {
    getWatchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Baloon(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              FontAwesomeIcons.chevronCircleLeft,
                              size: Sizer.fontFour(),
                              color: Clr.white,
                            ),
                          ),
                        ),
                        Text(
                          'Free Movies',
                          style: TextStyle(
                            color: Clr.white,
                            fontSize: Sizer.fontThree(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (Video video in _videos) ...[
                    VideorCard(video: video),
                    SizedBox(height: 10,)
                    ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getWatchList() async {
    var videos = await WatchListApi.videos();
    setState(() {
      _videos = videos;
    });
  }
}
