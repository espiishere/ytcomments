import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';
import "chat.dart";

class VideoPage2 extends StatefulWidget {
  const VideoPage2({super.key});

  @override
  State<VideoPage2> createState() => _VideoPage2State();
}

String vTitle = "Pokemon 2023 Finals";
String thumbnail = "Champ.jpg";
String userpic = "pkmcompany.jpg";
String username = "Pokemon Official";
bool isLike = true;
bool isDislike = true;
String defaultPic = "Logo1.png";




class _VideoPage2State extends State<VideoPage2> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

//--------------------------------------------------------------------------------------------------------------------------------------------------
Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.black,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),

                  child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }
//--------------------------------------------------------------------------------------------------------------------------------------------------


  @override
  Widget build(BuildContext context) {
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
                        child: Image.asset(
                          thumbnail,
                          width: 700,
                          height: 450,
                          fit: BoxFit.fill,
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
                      child: CircleAvatar(
                        backgroundImage: AssetImage(userpic),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      username,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   border: Border.all(
                    //     width: 2,
                    //   ),
                    // ),
                  ),
                  Flexible(
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
                                  color: isLike ? Colors.black : Colors.green,
                                  splashRadius: 20,
                                  onPressed: () {
                                    print("I like it!");
                                    if (isDislike == false) {
                                      setState(() {
                                        isDislike = !isDislike;
                                        isLike = !isLike;
                                      });
                                    } else {
                                      setState(() {
                                        isLike = !isLike;
                                      });
                                    }
                                  },
                                ),
                              ),
                              const VerticalDivider(color: Colors.black),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_downward_rounded),
                                  color: isDislike ? Colors.black : Colors.red,
                                  splashRadius: 20,
                                  onPressed: () {
                                    print("I Dislike it");
                                    if (isLike == false) {
                                      setState(() {
                                        isDislike = !isDislike;
                                        isLike = !isLike;
                                      });
                                    } else {
                                      setState(() {
                                        isDislike = !isDislike;
                                      });
                                    }
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
                  ),
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
                          child: commentChild(filedata2),
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
                                filedata2.insert(0, value);
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
                          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.black),
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
    );
  }
}
