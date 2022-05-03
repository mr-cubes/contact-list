import 'dart:io';
import 'dart:typed_data';

import 'package:contact_list/contact.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final void Function(Contact contact) onSubmit;
  const AddPage({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  File? avatarFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Contact")),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: setAvatar,
                  child: Expanded(
                    child: CircleAvatar(
                        minRadius: 80,
                        maxRadius: 128,
                        foregroundImage: (avatarFile == null)
                            ? null
                            : FileImage(avatarFile!)),
                  )),
            )
          ])),
    );
  }

  Future<void> setAvatar() async {
    final platformFile =
        await FilePicker.platform.pickFiles(withReadStream: true);

    if (platformFile == null) return;

    setState(() {
      avatarFile = File(platformFile.files.single.path!);
    });
  }
}
