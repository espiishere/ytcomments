import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ytcomments/playlist.dart';
import 'user.dart';
import 'package:image_picker/image_picker.dart';

String defaultPic = "Logo1.png";

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late String title;
  final savedName = TextEditingController();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

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
        title: Text("$name's Profile",
            style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Container(
        color: Colors.red.withAlpha(30),
        child: Center(
          child: Column(
            children: [
              Text("Profile Picture", style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 250,
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          //Working on so that user can change default picture for a profile picture
                          backgroundImage: AssetImage("Logo1.png"),

                          backgroundColor: Colors.red.withAlpha(90),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 17,
                          child: InkWell(
                            child: Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text("Change Username", style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(12.0),
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
                        savedName == ""
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return PlaylistPage();
                                }),
                              )
                            : _setText();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return PlaylistPage();
                          }),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to change picture
  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("Image not found");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File("a");
        });
      } else {
        print("Image not found");
      }
    } else {
      print("Something is wrong");
    }
  }
}
