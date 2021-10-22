
import 'package:ahkam/getx/posts_controller.dart';
import 'package:ahkam/screens/show_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_items_search.dart';

class Search extends SearchDelegate<String> {
  Future<List<dynamic>?> getPosts()async{
    PostsController postsController = Get.find();
    List? posts;
    posts = postsController.posts.where((element) => element['title'].toString().toLowerCase().contains(query.toString()) ).toList();
    return posts;
  }
  List<dynamic> list;
  Map<String, dynamic> post;

  Search({ required this.list,required this.post});

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Colors.red,
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          color: Colors.green,
          progress: transitionAnimation),
      onPressed: () {
        close(context, '');
      },
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return query != ""
        ? Center(
      child: Container(
        height: sheight * 0.85,
        width: swidth,
        color: Colors.transparent,
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: FutureBuilder(
              future:getPosts(), // async work
              builder: (BuildContext context,
                  AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: swidth * 0.003),
                    itemBuilder: (BuildContext context, int index) {
                      return SerchList(snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  );
                }
              },
            )),
      ),
    )
        : Container();
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final word = [
      "كلمات البحث",
      "مثل سيارة",
      "مثل الكترونيات",
    ];
    final recWord = [
      "كلمات البحث",
      "مثل سيارة",
      "مثل الكترونيات",
    ];

    final suggestionList = query.isEmpty
        ? recWord
        : word.where((p) => p.startsWith(query)).toList();
    // TODO: implement buildSuggestions
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          //showResults(context);
        },
        leading: Icon(Icons.search),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

}

