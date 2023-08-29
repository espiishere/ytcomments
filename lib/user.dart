import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ytcomments/playlist.dart';

String name = "Test Mode";
bool isVisible = false;

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late String title;
  final savedName = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _setText() {
    setState(() {
      name = savedName.text;
    });
  }

  @override
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
        title: Text("Welcome!", style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Container(
        color: Colors.red.withAlpha(30),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Welcome to the Video Playlist Prototype!",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
              ),
              Text("Enter your Username to Begin",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 250,
                  child: TextField(
                      controller: savedName,
                      maxLength: 20,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Username',
                      ),
                      onSubmitted: (String savedName) async {
                        if (savedName == "") {
                          print("Please enter a Username");
                          setState(() {
                            isVisible = !isVisible;
                          });
                        } else {
                          _setText();

                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return PlaylistPage();
                            }),
                          );
                        }
                      }),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Text("Please enter a valid Username",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
