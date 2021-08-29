import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsController extends GetxController {

  List posts = [].obs;
  List postsByDepartment = [].obs;
  var jsonOpj;
  @override
  void onInit(){
    super.onInit();
    getPosts();
  }
  getPosts() async {
    var res = await http
        .get(Uri.parse('https://ahkam-app.herokuapp.com/posts/'));
    if (res.statusCode == 200) {
      jsonOpj = json.decode(res.body);
      //print(jsonOpj);
      posts.addAll(jsonOpj);
      return posts;
    } else {

    }

  }

  Future getPostsByDepartment(department)async{
    print(department);
    postsByDepartment = posts.where((element) => element['department']==department ).toList();

    return posts.every((post) =>post['department']==department );
  }

  getPostsById(id){
    return posts.where((post) =>post['_id']==id ).toList();
  }

  getPostsByTitle(title) async {
    var res = await http
        .get(Uri.parse('https://ahkam-app.herokuapp.com/posts/?title=$title'));
    if (res.statusCode == 200) {
      jsonOpj = json.decode(res.body);
      //print(jsonOpj);
      posts.addAll(jsonOpj);
      return posts;
    } else {

    }
  }


}