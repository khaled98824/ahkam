import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPost extends StatelessWidget {
  final Map<String, dynamic> post;
  final bool isFromSearch ;

  const ShowPost({required this.post,required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar:isFromSearch ? AppBar(
          title: Text(
            post['title'],
            style: Theme.of(context).textTheme.headline4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ):null,
        body: SingleChildScrollView(
          child:  Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: Get.width - 6,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange,
                  ),
                ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: ' العنوان : ',
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            TextSpan(
                              text:' ${post['title']}',
                            style: Theme.of(context).textTheme.headline5,),
                          ]
                      ),
                      textAlign:TextAlign.end ,

                    ),
                    RichText(
                      text: TextSpan(
                          text: '\n: تاريخ الإضافة    \n',
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            TextSpan(
                              text: post['createdDate'],
                              style: Theme.of(context).textTheme.headline5,),
                          ]
                      ),
                      textAlign:TextAlign.end ,

                    ),
                    RichText(
                      text: TextSpan(
                          text: ': تاريخ التعديل  \n',
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            TextSpan(
                              text: '${post['updatedDate']} \n',
                              style: Theme.of(context).textTheme.headline5,),
                          ]
                      ),
                      textAlign:TextAlign.end ,

                    ),

                    RichText(
                      text: TextSpan(
                          text: ': السؤال  \n',
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            TextSpan(
                              text: '${post['quz']} \n',
                              style: Theme.of(context).textTheme.headline5,),
                          ]
                      ),
                      textAlign:TextAlign.end ,

                    ),
                    RichText(
                      text: TextSpan(
                          text: ': المصدر  \n',
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            TextSpan(
                              text: '${post['source']} \n',
                              style: Theme.of(context).textTheme.headline5,),
                          ]
                      ),
                      textAlign:TextAlign.end ,

                    ),
                    RichText(
                      text: TextSpan(
                          text: ' الباب : ',
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            TextSpan(
                              text: '${post['category']} \n',
                              style: Theme.of(context).textTheme.headline5,),
                          ]
                      ),
                      textAlign:TextAlign.end ,

                    ),
                    RichText(
                      text: TextSpan(
                          text: ' الباب الفرعي : ',
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            TextSpan(
                              text: '${post['department']} \n',
                              style: Theme.of(context).textTheme.headline5,),
                          ]
                      ),
                      textAlign:TextAlign.end ,

                    ),
                    RichText(
                      text: TextSpan(
                            text: ' الكاتب : ',
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            TextSpan(
                              text: '${post['creatorName']} \n',
                              style: Theme.of(context).textTheme.headline5,),
                          ]
                      ),
                      textAlign:TextAlign.end ,
                    ),

                  ],
                ),),

                Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ': النص  ',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        SelectableText(
                          post['ar_text'],
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ))
              ],
            ),
          )),
        );
  }
}
