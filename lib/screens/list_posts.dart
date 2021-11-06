import 'package:ahkam/getx/posts_controller.dart';
import 'package:ahkam/models/constants.dart';
import 'package:ahkam/screens/EditPost.dart';
import 'package:ahkam/widgets/add_new_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfPosts extends StatefulWidget {
  const ListOfPosts({Key? key}) : super(key: key);

  @override
  _ListOfPostsState createState() => _ListOfPostsState();
}

class _ListOfPostsState extends State<ListOfPosts> {

  @override
  Widget build(BuildContext context) {
    final PostsController posts = Get.find();
    final user = FirebaseAuth.instance.currentUser;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
       Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back)),),
      body:FutureBuilder(
          builder: (context,data)=> Obx(()=>ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
            itemCount: posts.userPosts.length,
            itemBuilder: (context,index)=> Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal:8),
          child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            child: Row(
              children: <Widget>[
               InkWell(
                 onTap: (){
                   Get.to(()=>EditPost(numberOfPost: index));
                 },
                 child:  Container(
                   width: size.width -10,
                   height: size.height/4,
                   decoration: BoxDecoration(
                       color: Colors.orange.shade800,
                       borderRadius: BorderRadius.all(Radius.circular(10.0))),
                   child: Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                posts.deleteById(posts.userPosts[index]['_id'],);
                              },
                              child: Icon(Icons.delete_forever,color: Colors.grey,size: 36,),
                            ),
                            Text(
                              posts.userPosts[index]['category'],
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(
                           posts.userPosts[index]['quz'],
                           textAlign: TextAlign.end,
                           overflow: TextOverflow.ellipsis,
                           maxLines: MediaQuery.of(context).size.height >620 ?4:2,
                           style: TextStyle(fontSize: 13, color: Colors.white),
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(
                           posts.userPosts[index]['createdDate'],
                           textAlign: TextAlign.end,
                           overflow: TextOverflow.ellipsis,
                           maxLines: MediaQuery.of(context).size.height >620 ?4:2,
                           style: TextStyle(fontSize: 13, color: Colors.white),
                         ),
                       ],
                     ),
                   ),
                 ),
               )
              ],
            ),
          ),
        ),
      ))),
    );
  }

}
