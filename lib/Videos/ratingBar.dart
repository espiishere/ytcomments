
import 'package:flutter/material.dart';


//Experamental
import "Data/viddataMaster.dart";


bool isLike = false;
bool isDislike = false;



class ratingBar extends StatefulWidget {
  const ratingBar({super.key});

  @override
  State<ratingBar> createState() => _ratingBarState();
}

class _ratingBarState extends State<ratingBar> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        width: 650,
        height: 100,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
          child: Container(
            height: 70,
            width: 100,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_upward_rounded),
                    color: isLike ? Colors.green : Colors.black,
                    splashRadius: 20,
                    onPressed: () {
                      if (isLike == false) {
                        setState(() {
                          currentVideo["like"] = "true";
                          like = currentVideo["like"];
                          isLike = bool.parse(like);
                          currentVideo["dislike"] = "false";
                          dislike = currentVideo["dislike"];
                          isDislike = bool.parse(dislike);
                        });
                      } else {
                        setState(() {
                          currentVideo["like"] = "false";
                          like = currentVideo["like"];
                          isLike = bool.parse(like);
                        });
                      }

                      // print("I like it!");

                      // if (isDislike == true) {
                      //   setState(() {
                      //     isDislike = !isDislike;
                      //     isLike = !isLike;
                      //   });
                      // } else {
                      //   setState(() {
                      //     isLike = !isLike;
                      //   });
                      // }
                    },
                  ),
                ),
                const VerticalDivider(color: Colors.black),
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_downward_rounded),
                    color: isDislike ? Colors.red : Colors.black,
                    splashRadius: 20,
                    onPressed: () {
                      if (isDislike == false) {
                        setState(() {
                          currentVideo["dislike"] = "true";
                          dislike = currentVideo["dislike"];
                          isDislike = bool.parse(dislike);
                          currentVideo["like"] = "false";
                          like = currentVideo["like"];
                          isLike = bool.parse(like);
                        });
                      } else {
                        setState(() {
                          currentVideo["dislike"] = "false";
                          dislike = currentVideo["dislike"];
                          isDislike = bool.parse(dislike);
                        });
                      }

                      // print("I Dislike it");
                      // if (isLike == true) {
                      //   setState(() {
                      //     isDislike = !isDislike;
                      //     isLike = !isLike;
                      //   });
                      // } else {
                      //   setState(() {
                      //     isDislike = !isDislike;
                      //   });
                      // }
                    },
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
