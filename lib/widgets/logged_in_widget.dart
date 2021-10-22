import 'package:ahkam/getx/posts_controller.dart';
import 'package:ahkam/models/ModelPost.dart';
import 'package:ahkam/models/constants.dart';
import 'package:ahkam/provider/email_sign_in.dart';
import 'package:get/get.dart';

import '../provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  final BuildContext context;

  LoggedInWidget({required this.context});

  @override
  Widget build(BuildContext context) {
    final PostsController postsController = Get.find();
    final user = FirebaseAuth.instance.currentUser;
    TextEditingController nameController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController qwzController = TextEditingController();
    TextEditingController textController = TextEditingController();
    TextEditingController desController = TextEditingController();
    TextEditingController sourceController = TextEditingController();
    final _formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text('واجهة الإضافة'),centerTitle: true,),
      body: Form(
          key: _formkey,
          child:  Container(
              alignment: Alignment.center,
              color: Colors.blueGrey.shade900,
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                        child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: nameController,
                                    textAlign: TextAlign.right,
                                    maxLines: 2,
                                    decoration: InputDecoration(hintText: 'ضع أسمك هنا'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Fill name Input';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: titleController,
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Fill name Input';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(hintText: 'العنوان'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: qwzController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(hintText: 'السؤال'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Fill name Input';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: textController,
                                    textAlign: TextAlign.right,
                                    maxLength: 2500,
                                    maxLines: 10,
                                    decoration: InputDecoration(hintText: 'النص'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Fill name Input';
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: sourceController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(hintText: 'المصدر'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Fill name Input';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: desController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(hintText: 'الوصف',),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Fill name Input';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  infoSelected(),
                                  SizedBox(
                                    width: Get.width - 10,
                                    height: 50,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: Category_Ahkam.length,
                                        itemBuilder: (context, index) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 2),
                                          child: categoryItem(
                                              Category_Ahkam[index]['name']
                                                  .toString(), () {
                                            postsController.department.value = '';
                                            category = Category_Ahkam[index]['name']
                                                .toString();
                                            switch (index) {
                                              case 0:
                                                postsController.changeShowItem(index);
                                                postsController.showDep();

                                                break;
                                              case 1:
                                                postsController.changeShowItem(index);
                                                postsController.showDep();

                                                break;
                                              case 2:
                                                postsController.changeShowItem(index);
                                                postsController.showDep();

                                                break;
                                              case 3:
                                                postsController.changeShowItem(index);
                                                postsController.showDep();

                                                break;
                                              case 4:
                                                postsController.changeShowItem(index);
                                                postsController.showDep();

                                                break;
                                              case 5:
                                                postsController.changeShowItem(index);
                                                postsController.showDep();

                                                break;
                                              case 6:
                                                postsController.changeShowItem(index);
                                                postsController.showDep();

                                                break;
                                              case 7:
                                                department = Category_Ahkam[7]['name'].toString();
                                                postsController.department.value =department;
                                                postsController.category.value =department;
                                                postsController.hideDep();

                                                print(department);
                                                break;
                                              case 8:
                                                department = Category_Ahkam[8]['name'].toString();
                                                postsController.department.value =department;
                                                postsController.category.value =department;
                                                postsController.hideDep();

                                                print(department);
                                                break;
                                              case 9:
                                                department = Category_Ahkam[9]['name'].toString();
                                                postsController.department.value =department;
                                                postsController.category.value =department;
                                                postsController.hideDep();

                                                print(department);
                                                break;
                                            }
                                          },Colors.blue.shade800),
                                        )),
                                  ),
                                  //department
                                  GetX<PostsController>(
                                      init: PostsController(),
                                      builder: (postsController2) {
                                        return postsController.hideDepartments.value ==false? SizedBox(
                                          width: Get.width - 10,
                                          height: 50,
                                          child:  ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: postsController2
                                                  .listDepartment.length,
                                              itemBuilder: (context, index) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 2),
                                                child: categoryItem(
                                                    postsController2
                                                        .listDepartment[index]
                                                        .toString(), () {
                                                  department = postsController2.listDepartment[index].toString();
                                                  postsController.department.value =department;
                                                  print('$category :: $department');
                                                },Colors.orange),
                                              )),
                                        ):Container();}),
                                  Text(
                                    'Logged In',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(height: 8),
                                  if (user!.photoURL != null)
                                    CircleAvatar(
                                      maxRadius: 25,
                                      backgroundImage: NetworkImage(user.photoURL!),
                                    ),
                                  SizedBox(height: 8),
                                  if (user.displayName != null)
                                    Text(
                                      'Name: ' + user.displayName!,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Email: ' + user.email!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      final isValid = _formkey
                                          .currentState!
                                          .validate();
                                      _formkey.currentState!.save();

                                      final post = Posts(
                                        title: titleController.text,
                                        source: sourceController.text,
                                        creatorName: nameController.text,
                                        quz: qwzController.text,
                                        ar_text: textController.text,
                                        createdDate: DateTime.now().toString(),
                                        en_quz: 'en-quz',
                                        en_text: 'en_text',
                                        en_title: 'en_title',
                                        updatedDate: DateTime.now().toString(),
                                        category: category,
                                        department: department,
                                        description: desController.text,
                                        deviceNo: 'deviceNo',
                                        views: 0,
                                      );
                                      try {
                                        if (category.length>1 && department.length>1 ) {
                                          postsController.addPost(post).then((value) {
                                            textController.clear();
                                            sourceController.clear();
                                            titleController.clear();
                                            desController.clear();
                                            qwzController.clear();
                                            department= "";
                                            category ="";
                                            postsController.department.value = '';
                                            postsController.category.value = '';
                                            Get.snackbar('تمت الإضافة بنجاح', 'شكراً تمت الاضافة بارك الله بك');

                                          }).catchError((err){
                                            Get.snackbar('معلومات غير صحيحة','حاول مجددا');
                                            throw(err);
                                          });

                                        }  else{
                                          Get.snackbar('اختر الباب الرئيسي والفرعي', 'الرجاء اختيار الأبواب');
                                        }
                                      } catch (err) {
                                        throw err;
                                      }
                                    },
                                    child: Text('حفظ'),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 4,
                                    width: Get.width - 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.deepOrange),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                     try{
                                       final provider = Provider.of<GoogleSignInProvider>(
                                           context,
                                           listen: false);
                                       provider.logout();
                                     }catch(err){
                                       throw err;
                                     }
                                    },
                                    child: Text('Logout'),
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  )))),
    );


  }

  bool choseCategory = false;
  String category = '';
  String department = '';

  bool choseCategory2 = true;

  Widget infoSelected() {
    return GetX<PostsController>(
        init: PostsController(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                color: Colors.grey.shade300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4, top: 4),
                      child: Text(
                        '  ${controller.category}',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4, top: 4),
                      child: Text(
                        ': الباب الرئيسي  ',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 5,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.grey[100],
                ),
              ),
              Container(
                color: Colors.grey.shade300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4, top: 4),
                      child: Text(
                        '  ${controller.department}',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4, top: 4),
                      child: Text(
                        ': الباب الفرعي  ',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  ////
  bool showInfoSelected = false;

  Widget categoryItem(String text, function ,color) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          child: Text(text,style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
