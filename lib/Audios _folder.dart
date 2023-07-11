import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'audiosuploading and View.dart';
import 'customButton.dart';

class AudiosFolder extends StatefulWidget {
  @override
  _AudiosFolderState createState() => _AudiosFolderState();
}

class _AudiosFolderState extends State<AudiosFolder> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Audio Upload'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Sheikh Al-Quran Ghulamullah Khan",
                      onPressed: null,
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Sheikh Imam Tahir Panj Peiri",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Shaykh al-Qur'an Wali Allah Kabuligrami",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Qazi Ismatullah",
                      onPressed: null,
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Manazer Islam Yunus Nomani",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Sheikh Al-Quran Tayyab Tahiri Sahib",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Mufti Muhammad Khan Al-Jajravi Sahib",
                      onPressed: null,
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Sheikh Allama Khizr Hayat Bhakrovi Sahib",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Mufti Mujtabi Amir Sahib",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Allama Muhammad Ataullah Bandilvi Sahib",
                      onPressed: null,
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Maulana Ahmad Jamshed Khan Sahib",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioUploadScreen(),
                        ),
                      );
                    },
                    child: MyButton(
                      icon: Icons.folder_outlined,
                      text: "Maulana Saeedul Rehman Al Khatib Sahib",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}
