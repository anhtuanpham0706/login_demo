import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_demo/model/content.dart';


class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({ this.category});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){

      },
      splashColor: Colors.deepPurple,
      child: Container(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('this.category.icon'),


              Text(this.category.content, style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,
                  color: Colors.white
              ),)
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}


