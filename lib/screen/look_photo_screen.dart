import 'package:flutter/material.dart';

class LookPhotoScreen extends StatelessWidget {
  const LookPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var img =
        "https://firebasestorage.googleapis.com/v0/b/gallery-7e9ba.appspot.com/o/gallery%2FO8ys30kmfIfLSYVkAxot?alt=media&token=6a0d0ef0-32c3-46b3-89d2-80dd191e1638";

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
            Text("야옹"),
            Text("2022 2.23 오전 3시 10분"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
            ),
          )
        ],
      ),
      body: Image.network(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
