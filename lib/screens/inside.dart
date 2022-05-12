import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  final index;
  Display({Key? key, required this.index}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  var arr = [
    "https://www.accesalabs.com/downloads/quest-lab-test-sample-report/Blood-Type-Test-Results.jpg",
    "https://lenvica.b-cdn.net/wp-content/uploads/2014/07/Blood-Group.png",
    "https://0.academia-photos.com/attachment_thumbnails/49312668/mini_magick20190131-13343-wmcfr6.png?1549004816",
    "https://s2.studylib.net/store/data/015383250_1-fbcef631fb191e0de27286539955da3b-768x994.png",
    "https://www.pdffiller.com/preview/15/310/15310445.png",
    "https://www.pdffiller.com/preview/12/879/12879348.png",
    "https://www.accesalabs.com/downloads/quest-lab-test-sample-report/Blood-Type-Test-Results.jpg",
    "https://lenvica.b-cdn.net/wp-content/uploads/2014/07/Blood-Group.png",
    "https://0.academia-photos.com/attachment_thumbnails/49312668/mini_magick20190131-13343-wmcfr6.png?1549004816",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              child: Image(image: NetworkImage(arr[widget.index])),
            )
          ],
        ),
      ),
    );
  }
}
