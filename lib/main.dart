import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'profile.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IV Video',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green, //Use for Swatches
        // Color(0xFF10BE90),
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

//----------------------------------------------------------------------------------
class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [ProfilePage()];

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    // print('ready in 2...');
    // await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  //----------------------------------------------------------

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
      ),
      body: pages[currentPage],

      //                Section needed for later... Maybe

      //---------------------------------------------------------------------------

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint("Floating Action Button");
      //   },
      //   child: const Icon(Icons.add),
      // ),

      // bottomNavigationBar: NavigationBar(
      //   destinations: const [
      //     NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
      //     NavigationDestination(
      //         icon: Icon(
      //           Icons.attractions_rounded,
      //           size: 40,
      //         ),
      //         label: "Coasters"),
      //     NavigationDestination(
      //         icon: Icon(Icons.newspaper_rounded), label: "Da Update"),
      //   ],
      //   onDestinationSelected: (int index) {
      //     if (index == 2) {
      //       showModal(context);
      //     } else {
      //       setState(() {
      //         currentPage = index;
      //       });
      //     }
      //   },
      //   selectedIndex: currentPage,
      // ),

      //-------------------------------------------------------------------------
    );
  }

  //                          For Error messages
  //-------------------------------------------------------------------------

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
          "I'm working on it!\nPress 'Close' to go back",
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
}
