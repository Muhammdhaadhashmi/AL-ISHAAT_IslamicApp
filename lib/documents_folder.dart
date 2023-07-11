import 'package:flutter/material.dart';
import 'Pdfuploadand view.dart';
import 'customButton.dart';

class AllDocumentsFolder extends StatefulWidget {
  @override
  _AllDocumentsFolderState createState() => _AllDocumentsFolderState();
}

class _AllDocumentsFolderState extends State<AllDocumentsFolder> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('PDF Upload'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.08,
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
                    text: "AKayeedo Ilm ALKalam",
                    onPressed: null,
                  ),
                ),
                SizedBox(width: 5,),
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
                    text: "Seerat",
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 5,),
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
                    text: "Islahi Kutab",
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
                    text: "Dars-e-Nizami",
                    onPressed: null,
                  ),
                ),
                SizedBox(width: 5,),
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
                    text: "Mukhtalif Kutab",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}









// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'Utils/app_colors.dart';
//
// class PDFUploadScreen extends StatefulWidget {
//   @override
//   _PDFUploadScreenState createState() => _PDFUploadScreenState();
// }
//
// class _PDFUploadScreenState extends State<PDFUploadScreen> {
//   FilePickerResult? _selectedPDF;
//   bool _isUploading = false;
//
//   void _selectPDF() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//
//     if (result != null) {
//       setState(() {
//         _selectedPDF = result;
//       });
//     }
//   }
//
//   void _uploadPDF() async {
//     if (_selectedPDF == null) {
//       return;
//     }
//
//     setState(() {
//       _isUploading = true;
//     });
//
//     String fileName = _selectedPDF!.files.single.name;
//     String? filePath = _selectedPDF!.files.single.path;
//     Reference storageReference =
//     FirebaseStorage.instance.ref().child('documents/$fileName');
//
//     try {
//       await storageReference.putFile(File(filePath!));
//
//       String downloadURL = await storageReference.getDownloadURL();
//
//       // Save file metadata in Firestore
//       await FirebaseFirestore.instance.collection('documents').add({
//         'name': fileName,
//         'url': downloadURL,
//       });
//
//       setState(() {
//         _isUploading = false;
//         _selectedPDF = null;
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('PDF uploaded successfully!')),
//       );
//     } catch (error) {
//       setState(() {
//         _isUploading = false;
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to upload PDF. Please try again.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('PDF Upload'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _selectPDF,
//               style: ElevatedButton.styleFrom(
//                 primary: AppColors.green,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//               ),
//               child: Text(
//                 'Select PDF',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             if (_selectedPDF != null)
//               Container(
//                 height: 300,
//                 child: Card(
//                   elevation: 2.0,
//                   child: PDFView(
//                     filePath: _selectedPDF!.files.single.path!,
//                     enableSwipe: true,
//                     swipeHorizontal: true,
//                     autoSpacing: false,
//                     pageFling: false,
//                     onRender: (pages) {
//                       print('Rendered $pages pages');
//                     },
//                     onError: (error) {
//                       print('PDFView encountered an error: $error');
//                     },
//                   ),
//                 ),
//               ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _isUploading ? null : _uploadPDF,
//               style: ElevatedButton.styleFrom(
//                 primary: _isUploading ? Colors.grey : AppColors.green,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//               ),
//               child: _isUploading
//                   ? CircularProgressIndicator()
//                   : Text(
//                 'Upload PDF',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PDFListScreen(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: AppColors.green,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//               ),
//               child: Text(
//                 'View PDF List',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class PDFListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text(
//           'PDF List',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('documents').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           if (snapshot.hasError) {
//             return Center(child: Text('Error fetching data'));
//           }
//
//           List<DocumentSnapshot> documents = snapshot.data!.docs;
//
//           if (documents.isEmpty) {
//             return Center(child: Text('No documents found'));
//           }
//
//           return ListView.builder(
//             itemCount: documents.length,
//             itemBuilder: (context, index) {
//               String name = documents[index].get('name');
//               String url = documents[index].get('url');
//
//               return Card(
//                 elevation: 2.0,
//                 margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: ListTile(
//                   title: Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PDFViewScreen(
//                           url: url,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
//
// class PDFViewScreen extends StatefulWidget {
//   final String url;
//
//   const PDFViewScreen({Key? key, required this.url}) : super(key: key);
//
//   @override
//   State<PDFViewScreen> createState() => _PDFViewScreenState();
// }
//
// class _PDFViewScreenState extends State<PDFViewScreen> {
//   PDFDocument? document;
//
//   @override
//   void initState() {
//     super.initState();
//     initializePdf();
//   }
//
//   void initializePdf() async {
//     document = await PDFDocument.fromURL(widget.url);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.green,
//         title: Text('PDF Viewer'),
//       ),
//       body: document != null
//           ? PDFViewer(
//         document: document!,
//       )
//           : Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
