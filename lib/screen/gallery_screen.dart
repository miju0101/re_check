import 'package:check/screen/look_photo_screen.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("갤러리"),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Text("올리기"),
          )
        ],
      ),
      // body: GridView.builder(
      //   shrinkWrap: true,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //   ),
      //   itemCount: gallery.length,
      //   itemBuilder: (context, index) {
      //     var current_photo = gallery[index];

      //     return InkWell(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => LookPhotoScreen(),
      //           ),
      //         );
      //       },
      //       child: Image.network(
      //         current_photo["photo_url"],
      //         fit: BoxFit.cover,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
