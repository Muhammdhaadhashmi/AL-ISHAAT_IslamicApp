import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageuploadingText extends StatefulWidget {
  const ImageuploadingText({Key? key}) : super(key: key);

  @override
  State<ImageuploadingText> createState() => _ImageuploadingTextState();
}

class _ImageuploadingTextState extends State<ImageuploadingText> {
  File? _imageFile;
  final picker = ImagePicker();
  final TextEditingController _textEditingController =
  TextEditingController();
  final CollectionReference _imagesCollection =
  FirebaseFirestore.instance.collection('images');

  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      final imageRef = _imagesCollection.doc();
      final imageUrl = await imageRef.id;
      await imageRef.set({'imageUrl': imageUrl, 'text': _textEditingController.text});

      final uploadTask = FirebaseStorage.instance
          .ref('images/$imageUrl')
          .putFile(_imageFile!);
      await uploadTask.whenComplete(() {
        setState(() {
          _imageFile = null;
          _textEditingController.clear();
        });
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Image Uploading and Text'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Pick Image'),
          ),
          if (_imageFile != null) Image.file(_imageFile!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _uploadImage,
            child: const Text('Upload Image and Text'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Uploaded Images:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _imagesCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final documents = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final data = documents[index].data() as Map<String, dynamic>;
                      final imageUrl = data['imageUrl'] as String?;
                      final text = data['text'] as String?;
                      return ListTile(
                        title: imageUrl != null
                            ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        )
                            : const SizedBox.shrink(),
                        subtitle: text != null ? Text(text) : const SizedBox.shrink(),
                      );
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
