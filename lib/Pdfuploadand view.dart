import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFUploadScreen extends StatefulWidget {
  @override
  _PDFUploadScreenState createState() => _PDFUploadScreenState();
}

class _PDFUploadScreenState extends State<PDFUploadScreen> {
  FilePickerResult? _selectedPDF;
  bool _isUploading = false;

  void _selectPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedPDF = result;
      });
    }
  }

  void _uploadPDF() async {
    if (_selectedPDF == null) {
      return;
    }

    setState(() {
      _isUploading = true;
    });

    String fileName = _selectedPDF!.files.single.name;
    String? filePath = _selectedPDF!.files.single.path;
    Reference storageReference =
    FirebaseStorage.instance.ref().child('documents/$fileName');

    try {
      await storageReference.putFile(File(filePath!));

      String downloadURL = await storageReference.getDownloadURL();

      // Save file metadata in Firestore
      await FirebaseFirestore.instance.collection('documents').add({
        'name': fileName,
        'url': downloadURL,
      });

      setState(() {
        _isUploading = false;
        _selectedPDF = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF uploaded successfully!')),
      );
    } catch (error) {
      setState(() {
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload PDF. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text('PDF Upload'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: _selectPDF,
              child: Text('Select PDF'),
            ),
            SizedBox(height: 16.0),
            if (_selectedPDF != null)
              Container(
                height: 300,
                child: Card(
                  elevation: 2.0,
                  child: PDFView(
                    filePath: _selectedPDF!.files.single.path!,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    onRender: (pages) {
                      print('Rendered $pages pages');
                    },
                    onError: (error) {
                      print('PDFView encountered an error: $error');
                    },
                  ),
                ),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isUploading ? null : _uploadPDF,
              child: _isUploading
                  ? CircularProgressIndicator()
                  : Text('Upload PDF'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFListScreen(parentContext: context),
                  ),
                );
              },
              child: Text('View PDF List'),
            ),
          ],
        ),
      ),
    );
  }
}

class PDFListScreen extends StatelessWidget {
  final BuildContext parentContext;

  PDFListScreen({required this.parentContext});

  void _deletePDF(String documentId) async {
    try {
      await FirebaseFirestore.instance.collection('documents').doc(documentId).delete();

      ScaffoldMessenger.of(parentContext).showSnackBar(
        SnackBar(content: Text('PDF deleted successfully!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(parentContext).showSnackBar(
        SnackBar(content: Text('Failed to delete PDF. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('documents').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          }

          List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            return Center(child: Text('No documents found'));
          }

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              String name = documents[index].get('name');
              String url = documents[index].get('url');
              String documentId = documents[index].id;

              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  title: Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFViewScreen(
                          url: url,
                        ),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete PDF'),
                            content: Text('Are you sure you want to delete this PDF?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: Text('Delete'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _deletePDF(documentId);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PDFViewScreen extends StatefulWidget {
  final String url;

  const PDFViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<PDFViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  PDFDocument? document;

  @override
  void initState() {
    super.initState();
    initializePdf();
  }

  void initializePdf() async {
    document = await PDFDocument.fromURL(widget.url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: document != null
          ? PDFViewer(document: document!)
          : Center(child: CircularProgressIndicator()),
    );
  }
}
