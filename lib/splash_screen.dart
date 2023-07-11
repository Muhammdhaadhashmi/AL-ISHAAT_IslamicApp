import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islam/homePage.dart';


class SplashScreen extends StatefulWidget {

  SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_logo.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        // child: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         'Assalam-o-Aliakum',
        //         style: TextStyle(
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white, // Customize the text color
        //         ),
        //       ),
        //       SizedBox(height: 20), // Add some spacing between the texts
        //       // Text(
        //       //   'Welcome',
        //       //   style: TextStyle(
        //       //     fontSize: 18,
        //       //     color: Colors.white, // Customize the text color
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}


















// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'Welcome_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Mywelcome()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue, // Customize the background color
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Assalam-o-Aliakum',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white, // Customize the text color
//               ),
//             ),
//             SizedBox(height: 20), // Add some spacing between the texts
//             // Text(
//             //   'Welcome',
//             //   style: TextStyle(
//             //     fontSize: 18,
//             //     color: Colors.white, // Customize the text color
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:islam/homePage.dart';
// import 'Utils/app_colors.dart';
//
// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);
//
//   @override
//   State<SplashView> createState() => _SplashViewState();
// }
//
// class _SplashViewState extends State<SplashView> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     Timer(Duration(seconds: 5), () {
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.green,
//       body: Center(
//         child: Image.asset(
//           "assets/icon.jpeg",
//           height: 200,
//           width: 200,
//           fit: BoxFit.fill
//           ,
//         ),
//       ),
//     );
//   }
// }
