import 'package:ahkam/screens/show_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SerchList extends StatelessWidget {
  final lis;

  SerchList(this.lis);

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
      EdgeInsets.only(left: swidth * 0.02, right: swidth * 0.02, bottom: 5.0,),
      child:InkWell(
        onTap: (){
          Get.to(()=>ShowPost(post: lis, isFromSearch: true,));
        },
        child: Container(
          padding: EdgeInsets.all(swidth * 0.015),
          height: sheight * 0.09,
          //width: MediaQuery.of(context).size.width*0.75,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(5)),
            color: Colors.black.withOpacity(0.5),
            // set border width
            // set rounded corner radius
            // make rounded corner of border
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                    width: swidth * 0.4,
                    child: Text(
                      lis["title"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,

                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sheight * 0.019,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 8,),
                SizedBox(
                    width: swidth * 0.4,
                    height: sheight*0.1,
                    child: Text(
                      lis["ar_text"],
                      overflow: TextOverflow.ellipsis,
                      maxLines:8,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sheight * 0.013,
                          fontWeight: FontWeight.bold),
                    )),

              ],
            ),
          )
      ),)
    );
  }
}