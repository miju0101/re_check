import 'package:check/screen/look_photo_screen.dart';
import 'package:check/service/gallery_service.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final Map<String, dynamic> myInfo;

  const GalleryScreen({required this.myInfo});

  @override
  Widget build(BuildContext context) {
    var galleryService = GalleryService();
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
            onPressed: () async {
              galleryService.uploadImages(myInfo);
            },
            child: Text("올리기"),
          )
        ],
      ),
      body: FutureBuilder(
        future: galleryService.getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var doc = snapshot.data!.docs;

            return GridView.builder(
              itemCount: doc.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                var current_img = doc[index];
                print(current_img);

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LookPhotoScreen(photo_info: current_img),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        current_img["photo_url"][0],
                        fit: BoxFit.cover,
                      ),
                      if (current_img["photo_url"].length > 1)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Text("+${current_img["photo_url"].length}"),
                        ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("데이터를 가져오는 중..."),
            );
          }
        },
      ),
    );
  }
}
