import 'package:check/service/gallery_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LookPhotoScreen extends StatelessWidget {
  const LookPhotoScreen({required this.photo_info});
  final QueryDocumentSnapshot photo_info;

  @override
  Widget build(BuildContext context) {
    var galleryService = GalleryService();

    return Scaffold(
      backgroundColor: Colors.black,
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
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(photo_info["profile_img"]),
                  radius: 15,
                ),
                Text(photo_info["name"]),
              ],
            ),
            Text(
              DateFormat("yyyy M dd a hh:mm").format(
                photo_info["sendDate"].toDate(),
              ),
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.download),
          ),
          IconButton(
            onPressed: () {
              galleryService.deleteImg(photo_info.id);
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: PageView.builder(
        itemCount: photo_info["photo_url"].length,
        itemBuilder: (context, index) {
          var current_img = photo_info["photo_url"][index];

          return Center(
            child: Image.network(
              current_img,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
