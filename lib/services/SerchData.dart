

import 'package:ahkam/screens/show_post.dart';
import 'package:flutter/material.dart';

class SearchData extends SearchDelegate<String> {
   List<dynamic> list;
   Map<String, dynamic> post;

   SearchData({ required this.list,required this.post});

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
   return ShowPost(post:post ,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var staticList = ['aa', 'bb'];
    var sugList = query.isEmpty
        ? staticList
        : list.where((element) => element['title'].startsWith(query)).toList();

    // TODO: implement buildSuggestions
    return ListView.builder(
        itemCount: sugList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.book),
            onTap: (){
              post = query.isNotEmpty ?sugList[index]:null;
              query.isNotEmpty ? showResults(context):null;
            },
            title: Text(
                query.isEmpty ? staticList[index] : sugList[index]['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        });
  }
}
