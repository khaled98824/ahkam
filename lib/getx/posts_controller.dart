import 'package:ahkam/models/ModelPost.dart';
import 'package:ahkam/models/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsController extends GetxController {
  List posts = [].obs;
  List postsByDepartment = [].obs;
  var jsonOpj;
  var listDepartment=[''].obs;
  var category = ''.obs ;
  var department = ''.obs;
  var hideDepartments = false.obs;

  changeShowItem(index) {
    listDepartment.value =departments[index] ;
    category.value = Category_Ahkam[index]['name'].toString();
  }

  hideDep(){
    hideDepartments.value = true;
  }
  showDep(){
    hideDepartments.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();

  }

  getPosts() async {
    var res =
        await http.get(Uri.parse('https://ahkam-app.herokuapp.com/posts/'));
    if (res.statusCode == 200) {
      jsonOpj = json.decode(res.body);
      posts.addAll(jsonOpj);
      print('posts count = ${posts.length}');
      return posts;
    } else {}
  }

  Future getPostsByDepartment(department) async {
    print(department);
    postsByDepartment =
        posts.where((element) => element['department'] == department).toList();

    return posts.every((post) => post['department'] == department);
  }

  getPostsById(id) {
    return posts.where((post) => post['_id'] == id).toList();
  }

  getPostsByTitle(title) async {
    var res = await http
        .get(Uri.parse('https://ahkam-app.herokuapp.com/posts/?title=$title'));
    if (res.statusCode == 200) {
      jsonOpj = json.decode(res.body);
      //print(jsonOpj);
      posts.addAll(jsonOpj);
      return posts;
    } else {}
  }

  Future addPost(Posts posts) async {
    var res = await http
        .post(Uri.parse('https://ahkam-app.herokuapp.com/posts'), body: {
      'title': posts.title,
      'source': posts.source,
      'creatorName': posts.creatorName,
      'quz': posts.quz,
      'ar_text': posts.ar_text,
      'createdDate': posts.createdDate,
      'en_quz': posts.en_quz,
      'en_text': posts.en_text,
      'en_title': posts.en_title,
      'updatedDate': posts.updatedDate,
      'category': posts.category,
      'department': posts.department,
      'description': posts.description,
      'deviceNo': posts.deviceNo,
      'views': posts.views.toString(),
    });
    return res.body;
  }
}
