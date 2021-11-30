import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Categories1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories1 = [
      {"icon": "lib/assets/icons/Discover.svg", "text": "Location"},
      {"icon": "lib/assets/icons/Settings.svg", "text": "Setting"},
    ];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          categories1.length,
              (index) => CategoryCard(
            icon: categories1[index]["icon"],
            text: categories1[index]["text"],

          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String? icon, text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: SizedBox(
        width: 170,
        height: 170,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                color: Color(0xFF48556B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: SvgPicture.asset(icon!),
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(height: 5,),
                  Text(text!, textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,color: Colors.white,
                        ),)
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
