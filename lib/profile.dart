import 'package:flutter/material.dart';
import 'package:ytcomments/Videos/video1.dart';
import 'package:ytcomments/Videos/video2.dart';
import 'package:ytcomments/Videos/video3.dart';

const int itemCount = 3;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ignore: override_on_non_overriding_member

  List<String> image = ['Thumbnail1.jpg', 'Champ.jpg', "Thumbnail3.jpg"];
  List<String> title = [
    'Steelers @ Ravens 2017 Highlights',
    "Pokemon 2023 Finals",
    "HersheyPark Skyrush POV"
  ];
  Widget card(String image, String title, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        color: Colors.red[50],
        elevation: 8.0,
        margin: EdgeInsets.all(7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: 600,
          height: 200,
          child: InkWell(
            splashColor: Colors.red.withAlpha(30),

//-----------------------------------------------------------------------------------------------

            onTap: () async {
              switch (title) {
                case 'Steelers @ Ravens 2017 Highlights':
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return VideoPage1();
                    }),
                  );
                  break;
                  case 'Pokemon 2023 Finals':
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return VideoPage2();
                    }),
                  );
                  break;
                  case 'HersheyPark Skyrush POV':
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return VideoPage3();
                    }),
                  );
                  break;


                default:
                  print("Invalid Video");
              }

              debugPrint("This is ${title}");
//-----------------------------------------------------------------------------------------------
            },
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Image.asset(
                    image,
                    height: 150,
                    width: 150,
                  ),
                ),
                Row(
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
      body: ListView.builder(
        itemCount: image.length,
        itemBuilder: (BuildContext context, int index) {
          return card(image[index], title[index], context);
        },
      ),
    );
  }
}
