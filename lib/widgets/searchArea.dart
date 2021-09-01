import 'package:ahkam/getx/posts_controller.dart';
import 'package:ahkam/services/SerchData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAreaDesign extends StatefulWidget {
  @override
  _SearchAreaDesignState createState() => _SearchAreaDesignState();
}

class _SearchAreaDesignState extends State<SearchAreaDesign> {
  final PostsController postsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       showSearch(context: context, delegate: SearchData(list: postsController.posts, post: {}));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
        child: Container(
          height: 42,
          // width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
          child: Stack(
            alignment: Alignment(0.3, 0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('!... إبحث في تطبيق أحكام',
                    style: Theme.of(context).textTheme.headline3),
              ),
              Align(
                  alignment: Alignment(0.9, 0),
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}