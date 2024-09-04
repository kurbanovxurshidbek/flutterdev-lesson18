import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/post_model.dart';

class MyFeedPage extends StatefulWidget {
  final PageController? pageController;

  const MyFeedPage({super.key, this.pageController});

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  String testImg1 =
      "https://images.unsplash.com/photo-1724805053809-3c09736b2ade?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  String testImg2 =
      "https://plus.unsplash.com/premium_photo-1670176447307-c8794f768645?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  String userImg =
      "https://images.unsplash.com/photo-1488424138610-252b5576e079?q=80&w=2100&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  bool isLoading = false;
  List<Post> items = [];

  @override
  void initState() {
    super.initState();
    var post1 = Post(
        "avg=237290.30ms min=237290.30ms max=237290.30ms count=1", testImg1);
    post1.fullname = "Xurshidbek";
    post1.img_user = userImg;
    post1.date = "2024-08-30 12:23";
    post1.liked = true;
    post1.mine = true;

    var post2 = Post(
        "avg=237290.30ms min=237290.30ms max=237290.30ms count=1", testImg2);
    post2.fullname = "Begzodbek";
    post2.img_user = "";
    post2.date = "2024-08-20 08:20";
    post2.liked = false;
    post2.mine = false;

    items.add(post1);
    items.add(post2);
  }

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
            onPressed: () {
              widget.pageController!.animateToPage(2,
                  duration: Duration(microseconds: 200), curve: Curves.easeIn);
            },
            icon: Icon(Icons.camera_alt),
            color: Color.fromRGBO(193, 53, 132, 1),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              return _itemOfPost(items[index]);
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Divider(),
          // #user_info
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: post.img_user.isNotEmpty
                            ? Image.network(
                                post.img_user,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              )
                            : const Image(
                                width: 40,
                                height: 40,
                                image:
                                    AssetImage("assets/images/ic_person.png"),
                                fit: BoxFit.cover,
                              )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.fullname,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          post.date,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
                post.mine
                    ? IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),

          // #post_image
          CachedNetworkImage(
            width: MediaQuery.of(context).size.width,
            imageUrl: post.img_post,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            fit: BoxFit.cover,
          ),

          // #like_share
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (post.liked) {
                      post.liked = false;
                    } else {
                      post.liked = true;
                    }
                  });
                },
                icon: post.liked
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
            ],
          ),

          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                  text: post.caption, style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
