import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class RunningFragment extends StatefulWidget {
  RunningFragment({Key key, @required this.switchFragment}) : super(key: key);

  final switchFragment;
  @override
  _RunningFragmentState createState() => _RunningFragmentState();
}

class _RunningFragmentState extends State<RunningFragment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text(
                  'No Running Order',
                  style: TextStyle(
                    color: Clr.green,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizer.fontFour(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.switchFragment(0);
                  },
                  child: Text(
                    "click here to look for customers",
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}