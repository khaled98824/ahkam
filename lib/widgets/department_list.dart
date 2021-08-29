
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget info(icon,title,callback,colorIcon){
  return Column(
    children: [
      InkWell(
        onTap: callback,
        child: Padding(
          padding:
          EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 5,),
              Icon(FontAwesomeIcons.caretLeft),
              Spacer(),
              Text(title,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontFamily: '')),
              SizedBox(width: 5,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[400]),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 4, horizontal: 12),
                  child: Center(
                    child: Icon(
                      icon,
                      color: colorIcon,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 11,)
            ],
          ),
        ),
      ),
      Container(
        width: Get.width,
        height: 1,
        color: Colors.grey,
      ),
    ],
  );
}