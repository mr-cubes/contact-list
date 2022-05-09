import 'dart:io';
import 'dart:typed_data';

import 'package:contact_list/contact.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    ctrlName = TextEditingController();
    ctrlEmail = TextEditingController();
    ctrlMobileNo = TextEditingController();
    formKey = GlobalKey<FormState>();
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
              child: Form(
                key: formKey,
                child: Column(children: [
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: setAvatar,
                        child: Expanded(
                          child: CircleAvatar(
                              minRadius: 80,
                              maxRadius: 110,
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
                          counterText: "",
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null) return "No value";
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Invalid format";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          counterText: "",
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
                      maxLength: 11,
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null) return "No value";
                        if (!RegExp(r"^(?:[+0]9)?[0-9]{11}$").hasMatch(value)) {
                          return "Invalid format";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          hintText: "Enter mobile number",
                          prefixIcon: const Icon(Icons.smartphone),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                        height: 40,
                        width: 120,
                        child: ElevatedButton(
                            onPressed: ok, child: const Text("OK"))),
                  )
                ]),
              ),
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

  void ok() {
    if (formKey.currentState == null) return;
    if (!(formKey.currentState!.validate())) return;

    widget.onSubmit(Contact(ctrlName.text, ctrlEmail.text, ctrlMobileNo.text,
        avatarFile == null ? null : Image.file(avatarFile!)));
    Navigator.pop(context);
  }
}
