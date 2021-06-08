import 'package:driver/models/Video.dart';
import 'package:driver/screens/movies/video_player.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class VideorCard extends StatelessWidget {
  VideorCard({Key key, @required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(video: video)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 140,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 140,
              child: FadeInImage(
                image: NetworkImage(
                  video.thumbnail,
                ),
                placeholder: AssetImage(
                  'lib/assets/images/loader.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Clr.green,
                ),
                child: Text(video.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              bottom: 0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: Icon(Icons.play_arrow, size: 50, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
