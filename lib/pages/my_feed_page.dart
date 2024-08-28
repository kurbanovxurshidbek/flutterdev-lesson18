import 'package:flutter/material.dart';

class MyFeedPage extends StatefulWidget {
  final PageController? pageController;

  const MyFeedPage({super.key, this.pageController});

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Instagram",
          style: TextStyle(
              color: Colors.black, fontFamily: 'Billabong', fontSize: 30),
        ),

        actions: [
          IconButton(
            onPressed: (){
              widget.pageController!.animateToPage(2,
                  duration: Duration(microseconds: 200), curve: Curves.easeIn);
            },
            icon: Icon(Icons.camera_alt),
            color: Color.fromRGBO(193, 53, 132, 1),
          ),
        ],
      ),
      body: Center(
        child: Text("Feed Page"),
      ),
    );
  }
}
