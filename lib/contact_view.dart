import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final Contact contact;
  const ContactView({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${contact.name} contacts"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(children: [
                Align(
                  alignment: Alignment.center,
                  child: Expanded(
                      child: CircleAvatar(
                    minRadius: 80,
                    maxRadius: 110,
                    foregroundImage:
                        (contact.avatar == null) ? null : contact.avatar!.image,
                  )),
                ),
                const SizedBox(height: 25),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      contact.name,
                      style: const TextStyle(fontSize: 19),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text("Email: ${contact.email}")),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text("Mobile number: ${contact.mobile}"),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Back"))),
                )
              ]),
            ),
          )),
    );
  }
}
