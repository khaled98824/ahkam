import 'package:ahkam/screens/show_post.dart';
import 'package:get/get.dart';
import 'package:ahkam/getx/posts_controller.dart';
import 'package:ahkam/widgets/department_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostsListItem extends StatelessWidget {
  final PostsController controller = Get.find();
  final String category;

  final String department;

  PostsListItem({required this.category, required this.department});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: Text(department,style: Theme.of(context).textTheme.headline4,),
        ),
        SliverToBoxAdapter(
            child: Obx(() => FutureBuilder(
                future: controller.getPostsByDepartment(department),
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (data.hasData) {
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.postsByDepartment.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 44,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          childAspectRatio: 0.5,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => info(
                                FontAwesomeIcons.book,
                                controller.postsByDepartment[index]['title'],
                                () {
                              Get.to(ShowPost(
                                post: controller.postsByDepartment[index],isFromSearch: true,
                              ));
                            }, Color.fromRGBO(122, 112, 112, 1)));
                  } else if (data.hasError) {
                    return Container(
                      child: Text('no data'),
                    );
                  }
                  {
                    return Container(
                      child: Text('no data'),
                    );
                  }
                })))
      ],
    ));
  }
}
