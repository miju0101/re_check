import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LookPhotoScreen extends StatelessWidget {
  const LookPhotoScreen({required this.photo_info});
  final QueryDocumentSnapshot photo_info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(photo_info["name"]),
            Text(
              DateFormat("yyyy M dd a hh:mm").format(
                photo_info["sendDate"].toDate(),
              ),
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.download),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Image.network(
        photo_info["photo_url"],
        fit: BoxFit.cover,
      ),
    );
  }
}
