import 'package:ahkam/models/constants.dart';
import 'package:ahkam/screens/posts.dart';
import 'package:ahkam/widgets/department_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryScrollView extends StatelessWidget {
  final String category;

  final int departmentCount;

  const CategoryScrollView(
      {Key? key, required this.category, required this.departmentCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.red,
          expandedHeight: 160,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/souq-alfurat-89023.appspot.com/o/WhatsApp%20Image%202020-09-15%20at%2011.23.35%20AM.jpeg?alt=media&token=a7c3f2d7-2629-4519-9c61-93444f989688',
              fit: BoxFit.cover,
            ),
            title: Text(
              category,
              style: Theme.of(context).textTheme.headline4,
            ),
            centerTitle: true,
          ),
          //title: Text('My App Bar'),
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            //Icon(Icons.settings),
            SizedBox(width: 12),
          ],
        ),
        SliverToBoxAdapter(
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: departments[departmentCount].length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 44,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.5,
              ),
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) => info(FontAwesomeIcons.book,
                      departments[departmentCount][index], () {

                    Get.to(PostsListItem(
                      category: category,
                      department: departments[departmentCount][index],
                    ));
                  }, Color.fromRGBO(122, 112, 112, 1))),
        ),
      ],
    ));
  }
}
//
