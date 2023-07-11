import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'AboutUs_Screen.dart';
import 'Audios _folder.dart';
import 'Imageuploading and Text.dart';
import 'Pdfuploadand view.dart';
import 'audiosuploading and View.dart';
import 'customButton.dart';
import 'documents_folder.dart';
import 'prayer_timescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
    'assets/slider1.jpg',
    'assets/slider2.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Colors.blueAccent,
        body: Stack(
          children: [
            // top slider
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height * 0.35,
              child: Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height * 0.29,
                child: CarouselSlider(
                  items: imageUrls.map((url) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(url),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.29,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                  ),
                ),
              ),
            ),
            // Bismillah image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.66,
                width: size.width,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/Bismillah.jpg',
                  height: size.height * 0.10,
                  width: size.width * 0.4,
                ),
              ),
            ),
            // body
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: size.height * 0.6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // custom button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AudiosFolder(),
                                ),
                              );
                            },
                            child: MyButton(
                              icon: Icons.folder_outlined,
                              text: "Audio Tafsir Al-Quran",
                              onPressed: () {},
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PDFUploadScreen(),
                                ),
                              );
                            },
                            child: MyButton(
                              icon: Icons.folder_outlined,
                              text: "Book Tafsir Al-Quran",
                              onPressed: null,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllDocumentsFolder(),
                                ),
                              );
                            },
                            child: MyButton(
                              icon: Icons.folder_outlined,
                              text: "Books of Scholars",
                              onPressed: () {},
                            ),
                          ),

                        ],
                      ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFUploadScreen(),
                              ),
                            );
                          },
                          child: MyButton(
                            icon: Icons.folder_outlined,
                            text: "Essential Beliefs",
                            onPressed: null,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrayerTimingScreen(),
                              ),
                            );
                          },
                          child: MyButton(
                            icon: Icons.folder_outlined,
                            text: "Prayer Timings",
                            onPressed: () {},
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUsScreen(),
                              ),
                            );
                          },
                          child: MyButton(
                            icon: Icons.folder_outlined,
                            text: "About Us",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageuploadingText(),
                              ),
                            );
                          },
                          child: MyButton(
                            icon: Icons.folder_outlined,
                            text: "Ulama of Ahle Sunnat",
                            onPressed: () {},
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageuploadingText(),
                              ),
                            );
                          },
                          child: MyButton(
                            icon: Icons.folder_outlined,
                            text: "Publication Centers",
                            onPressed: () {},
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageuploadingText(),
                              ),
                            );
                          },
                          child: MyButton(
                            icon: Icons.folder_outlined,
                            text: "Mashaikh publication",
                            onPressed: () {},
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:islam/prayer_timescreen.dart';
// import 'AboutUs_Screen.dart';
// import 'Audios _folder.dart';
// import 'alldocumentsuploader.dart';
// import 'customButton.dart';
// import 'documents_folder.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final List<String> imageUrls = [
//     'assets/slider1.jpeg',
//     'assets/slider2.jpeg',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             // top slider
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               height: size.height * 0.35,
//               child: Container(
//                 alignment: Alignment.topLeft,
//                 height: MediaQuery.of(context).size.height * 0.29,
//                 child: CarouselSlider(
//                   items: imageUrls.map((url) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(url),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                   options: CarouselOptions(
//                     height: MediaQuery.of(context).size.height * 0.29,
//                     autoPlay: true,
//                     autoPlayInterval: Duration(seconds: 5),
//                     viewportFraction: 1,
//                     enlargeCenterPage: false,
//                   ),
//                 ),
//               ),
//             ),
//             // body
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               height: size.height * 0.6,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // custom button
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children:  [
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => AudioUploadScreen()),
//                             );
//                           },
//                           child: MyButton(
//                               icon: Icons.folder_outlined,
//                               text: "Audio Tafsir Al-Quran",
//                             onPressed: (){},
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => PDFUploadScreen()),
//                               );
//
//                           },
//                             child: MyButton(
//                                 icon: Icons.folder_outlined,
//                                 text: "Book Tafsir Al-Quran", onPressed: null,
//                             ),
//                           ),
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => PDFUploadScreen()),
//                             );
//                           },
//                           child: MyButton(
//                               icon: Icons.folder_outlined,
//                               text: "Books of Scholars", onPressed: () {},),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: size.height * 0.05,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children:  [
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => ImageUploader()),
//                             );
//                           },
//
//                           child: MyButton(
//                               icon: Icons.folder_outlined,
//                               text: "Essential Beliefs", onPressed: null, ),
//                         ),
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => PrayerTimingScreen()),
//                             );
//                           },
//                           child: MyButton(
//                               icon: Icons.folder_outlined,
//                               text: "Prayer Timings", onPressed: () {},),
//                         ),
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => AboutUsScreen()),
//                             );
//                           },
//                           child: MyButton(icon: Icons.folder_outlined, text: "About Us", onPressed: () {
//
//                           },),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: size.height * 0.05,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // circle Avatar
//             // Positioned(
//             //   left: size.width * 0.4,
//             //   right: size.width * 0.4,
//             //   top: size.height * 0.21,
//             //   child: Column(
//             //     children: [
//             //       CircleAvatar(
//             //         radius: 35,
//             //         backgroundColor: Colors.white,
//             //         child: Container(
//             //           height: size.height * 0.16,
//             //           width: size.width * 0.16,
//             //           alignment: Alignment.center,
//             //           decoration: BoxDecoration(
//             //             color: Colors.grey.shade300,
//             //             shape: BoxShape.circle,
//             //           ),
//             //           child: const Icon(
//             //             Icons.person,
//             //             size: 30,
//             //             color: Colors.black,
//             //           ),
//             //         ),
//             //       ),
//             //       // TextButton(
//             //       //   onPressed: () {},
//             //       //   child: const Text(
//             //       //     "Login",
//             //       //     style: TextStyle(
//             //       //       color: Colors.black,
//             //       //     ),
//             //       //   ),
//             //       // ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
