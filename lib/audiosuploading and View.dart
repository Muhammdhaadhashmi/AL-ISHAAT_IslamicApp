import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AudioUploadScreen extends StatefulWidget {
  @override
  _AudioUploadScreenState createState() => _AudioUploadScreenState();
}

class _AudioUploadScreenState extends State<AudioUploadScreen> {
  List<File> _selectedAudios = [];
  bool _isUploading = false;

  void _selectAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _selectedAudios = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  Future<void> _uploadAudios() async {
    if (_selectedAudios.isEmpty) {
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      for (var audio in _selectedAudios) {
        String fileName = audio.path.split('/').last;
        Reference storageReference =
        FirebaseStorage.instance.ref().child('audios/$fileName');

        await storageReference.putFile(audio);

        String downloadURL = await storageReference.getDownloadURL();

        // Save file metadata in Firestore
        await FirebaseFirestore.instance.collection('audios').add({
          'name': fileName,
          'url': downloadURL,
        });
      }

      setState(() {
        _isUploading = false;
        _selectedAudios.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Audios uploaded successfully!')),
      );
    } catch (error) {
      setState(() {
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload audios. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Audio Upload'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: _selectAudio,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: Text(
                'Select Audios',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            if (_selectedAudios.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Audios:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: _selectedAudios
                        .map(
                          (audio) => Chip(
                        label: Text(
                          audio.path.split('/').last,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                ],
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isUploading ? null : _uploadAudios,
              style: ElevatedButton.styleFrom(
                primary: _isUploading ? Colors.grey : Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: _isUploading
                  ? SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2.0,
                ),
              )
                  : Text(
                'Upload Audios',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                FirebaseFirestore.instance.collection('audios').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<Widget> audioList = snapshot.data!.docs.map((doc) {
                    String name = doc['name'];
                    String url = doc['url'];
                    return ListTile(
                      title: Text(
                        name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Handle audio playback or any other action
                      },
                    );
                  }).toList();
                  return ListView.builder(
                    itemCount: audioList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Card(
                          elevation: 2.0,
                          child: audioList[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}