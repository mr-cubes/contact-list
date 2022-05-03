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
  late TextEditingController ctrlName;
  late TextEditingController ctrlEmail;
  late TextEditingController ctrlMobileNo;

  @override
  void initState() {
    super.initState();
    ctrlName = TextEditingController();
    ctrlEmail = TextEditingController();
    ctrlMobileNo = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Contact")),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
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
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    controller: ctrlName,
                    maxLength: 24,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Enter name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    controller: ctrlEmail,
                    maxLength: 24,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Enter email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    controller: ctrlMobileNo,
                    maxLength: 24,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Enter mobile number",
                        prefixIcon: const Icon(Icons.smartphone),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                )
              ]),
            ),
          )),
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
