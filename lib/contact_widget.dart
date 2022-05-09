import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;
  const ContactWidget({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: pushView,
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(3, 3),
                    blurRadius: 4)
              ]),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).primaryColor.withAlpha(200),
                  foregroundImage:
                      contact.avatar == null ? null : contact.avatar!.image),
            ),
            Text(
              contact.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ]),
        ),
      ),
    );
  }

  void pushView() {}
}
