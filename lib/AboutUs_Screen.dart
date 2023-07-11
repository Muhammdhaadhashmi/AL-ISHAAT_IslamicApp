
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('About Us'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/about us.jpeg'),
            ),
            SizedBox(height: 24.0),
            Text(
              'Islamic App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Islamic Books and Lectures',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.0),
            Text(
              'Allah makes the impossible possible',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Worldly life is short, so turn to Allah before you return to Allah.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
//
// class AboutUsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('About Us'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 80,
//               backgroundImage: AssetImage('assets/about us.jpeg'),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Islamic App',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green[900],
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Islamic Books and Lectures',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[700],
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'Allah makes the impossible possible',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green[900],
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Worldly life is short, so turn to Allah before you return to Allah.',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[700],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
