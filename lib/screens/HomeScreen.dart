import 'package:ahkam/getx/posts_controller.dart';
import 'package:ahkam/models/constants.dart';
import 'package:ahkam/page-auth/home_page.dart';
import 'package:ahkam/screens/posts.dart';
import 'package:ahkam/screens/show_post.dart';
import 'package:ahkam/widgets/new_posts_list.dart';
import 'package:ahkam/widgets/searchArea.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_scroll_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final CategoriesScroller categoriesScroller = CategoriesScroller();

  ScrollController controller = ScrollController();

  bool closeTopContainer = false;

  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = Category_Ahkam;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(InkWell(
        onTap: () {
          if(post['id'] ==8) {
            print('object');
            Get.to(
              PostsListItem(
                category: post['name'],
                department: post['name'],
              ),
            );
          }else if (post['id'] ==7){
            print('object');

            Get.to(
              PostsListItem(
                category: post['name'],
                department: post['name'],
              ),
            );
          }
          else if (post['id'] ==9){
            print('object');

            Get.to(
              PostsListItem(
                category: post['name'],
                department: post['name'],
              ),
            );
          }else{
            Get.to(CategoryScrollView(
              category: post['name'],
              departmentCount: post['id'],
            ));
          }
        },
        child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    "assets/images/${post["image"]}",
                    height: double.infinity,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        post["name"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat-Arabic Regular'),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " ${post["count"].toString()}",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30 - 50;
    final PostsController posts = Get.find();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('أحكام', style: Theme.of(context).textTheme.headline5),
          leading: IconButton(
           icon: Icon(Icons.admin_panel_settings,size: 29,color: Colors.blue.shade800,),
            color: Colors.black,
            onPressed: () { Get.to(HomePage()); },
          ),
          actions: <Widget>[],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              SearchAreaDesign(),
              const SizedBox(
                height: 10,
              ),
              Obx(()=>AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeTopContainer ? 0 : categoryHeight,
                  child: ListView.builder(
                      itemCount: posts.posts.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Get.to(ShowPost(post: posts.posts[index],isFromSearch: true,));
                        },
                        child: CategoriesScroller(
                          category: posts.posts[index]['category'].toString(),
                          quz: posts.posts[index]['quz'].toString(),
                          date: posts.posts[index]['date'].toString(),
                        ),
                      )
                  ),
                ),
              ),),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.8,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
