

//This section is in a work in progress to update to Playlist 

import 'package:flutter/material.dart';
import 'package:ytcomments/Videos/Data/chat.dart';

import 'package:ytcomments/Videos/masterVidTest.dart';

import "package:ytcomments/Videos/Data/viddataMaster.dart";
import "Videos/ratingBar.dart";

import "user.dart";

List currentChat = [];
const int itemCount = 3;

class PlaylistPageX extends StatefulWidget {
  const PlaylistPageX({super.key});

  @override
  State<PlaylistPageX> createState() => _PlaylistStateX();
}

class _PlaylistStateX extends State<PlaylistPageX> {
  // ignore: override_on_non_overriding_member

  List<String> image = ['ESPN1.jpg', 'Champ.jpg', "Thumbnail3.jpg"];
  List<String> title = [
    'Rise and Fall of ESPN',
    "Pokemon 2023 Finals",
    "HersheyPark Skyrush POV"
  ];

  List<int> vCount = [];
  Widget card(String image, String title, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        color: Colors.red[50],
        elevation: 8.0,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: 500,
          height: 200,
          child: InkWell(
            splashColor: Colors.red.withAlpha(30),

//-----------------------------------------------------------------------------------------------

            onTap: () async {
              switch (title) {
                case 'Rise and Fall of ESPN':
                  setState(() {
                    currentVideo = yt1;
                    vTitle = currentVideo["vTitle"];
                    username = currentVideo["username"];
                    userpic = currentVideo["userpic"];
                    thumbnail = currentVideo["thumbnail"];
                    video = currentVideo["video"];
                    like = currentVideo["like"];
                    isLike = bool.parse(like);
                    dislike = currentVideo["dislike"];
                    isDislike = bool.parse(dislike);
                    currentChat = filedata1;
                  });

                  break;
                case 'Pokemon 2023 Finals':
                  setState(() {
                    currentVideo = yt2;
                    vTitle = currentVideo["vTitle"];
                    username = currentVideo["username"];
                    userpic = currentVideo["userpic"];
                    thumbnail = currentVideo["thumbnail"];
                    video = currentVideo["video"];
                    like = currentVideo["like"];
                    isLike = bool.parse(like);
                    dislike = currentVideo["dislike"];
                    isDislike = bool.parse(dislike);
                    currentChat = filedata2;
                  });

                  break;
                case 'HersheyPark Skyrush POV':
                  setState(() {
                    currentVideo = yt3;
                    vTitle = currentVideo["vTitle"];
                    username = currentVideo["username"];
                    userpic = currentVideo["userpic"];
                    thumbnail = currentVideo["thumbnail"];
                    video = currentVideo["video"];
                    like = currentVideo["like"];
                    isLike = bool.parse(like);
                    dislike = currentVideo["dislike"];
                    isDislike = bool.parse(dislike);
                    currentChat = filedata3;
                  });
                  break;

                default:
                  print("Invalid Video");
              }
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return VideoPageX();
                }),
              );

              debugPrint("This is ${title}");
//-----------------------------------------------------------------------------------------------
            },

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  height: 150,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, 10), //EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          image,
                          height: 250,
                          width: 250,
                          alignment: Alignment.topCenter,
                        ),
                      )),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//-----------------------------------------------------------------------------------------------
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'Logo1.png',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //Container Sizing
                child: Text("$name's Playlist Prototype!",
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.person_3_sharp),
                  alignment: Alignment.center,
                  onPressed: () {
                    showModal(context);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (BuildContext context) {
                    //     return UserInfoPage();
                    //   }),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: image.length,
        itemBuilder: (BuildContext context, int index) {
          return card(image[index], title[index], context);
        },
      ),
    );
  }
}

void showModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: const Text(
        "Page blocked!\nPress 'Close' to go back",
        textAlign: TextAlign.left,
      ),
      actions: <TextButton>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        )
      ],
    ),
  );
}
