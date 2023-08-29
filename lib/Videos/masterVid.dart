import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:ytcomments/playlistDemo.dart';
// import 'Data/chat.dart';
//import "Data/viddata1.dart";
import "package:youtube_player_iframe/youtube_player_iframe.dart";
import "package:ytcomments/userInfo.dart";
import 'comments.dart';
import 'ratingBar.dart';

//Experamental
import 'Data/viddataMaster.dart';
//import "package:ytcomments/playlistDemo.dart";

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController controller;
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
          origin: "https://www.youtube.com",
          color: "Red",
          mute: false,
          showFullscreenButton: false,
          enableKeyboard: kIsWeb),
    );

    controller.loadVideo(video);
  }

  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      aspectRatio: 16 / 9,
      controller: controller,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: IconButton(
                  splashRadius: 100,
                  iconSize: 200,
                  icon: Ink.image(
                    image: AssetImage("Logo1.png"),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              top: true,
              child: Container(
                color: Colors.red.withAlpha(30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: 1000,
                        height: 600,
                        child: FractionallySizedBox(
                          widthFactor: .8,
                          heightFactor: .9,
                          child: Align(
                            alignment: AlignmentDirectional(-0.50, 0.08),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    player,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //width: 394,
                      height: 45,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          vTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                            child: Row(
                                children: userpic.contains(substring) == true
                                    ? [
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage("$userpic"),
                                          radius: 25,
                                        )
                                      ]
                                    : [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage("$userpic"),
                                          radius: 25,
                                        )
                                      ]),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   border: Border.all(
                          //     width: 2,
                          //   ),
                          // ),
                        ),
                        ratingBar(),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Container(
                      width: 600,
                      height: 625,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 600,
                            height: 600,
                            //--------------------------------------------------------------------------------------------------------------------------------------------------
                            child: CommentBox(
                              userImage: CommentBox.commentImageParser(
                                  imageURLorPath: defaultPic),
                              child: commentChild(currentChat),
                              labelText: 'Write a comment...',
                              errorText: 'Comment cannot be blank',
                              withBorder: false,
                              sendButtonMethod: () {
                                if (formKey.currentState!.validate()) {
                                  print(commentController.text);
                                  setState(() {
                                    var value = {
                                      'name': 'Test User',
                                      'pic': defaultPic,
                                      'message': commentController.text,
                                      'date': DateTime.now().toString()
                                    };
                                    currentChat.insert(0, value);
                                  });
                                  commentController.clear();
                                  FocusScope.of(context).unfocus();
                                } else {
                                  print("Not validated");
                                }
                              },
                              formKey: formKey,
                              commentController: commentController,
                              textColor: Colors.black,
                              sendWidget: Icon(Icons.send_sharp,
                                  size: 30, color: Colors.black),
                            ),

                            //--------------------------------------------------------------------------------------------------------------------------------------------------
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
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
      },
    );
  }
}
