import 'package:efotballactseller_app/views/screens/feeds_category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  CategoryItem({Key? key, required this.index}) : super(key: key);
  List<Map<String, Object>> categories = [
    {'categoryName': 'High', 'categoryImage': 'assets/images/high.jpeg'},
    {'categoryName': 'High', 'categoryImage': 'assets/images/featiured.jpeg'},
    {'categoryName': 'Medium', 'categoryImage': 'assets/images/legend.jpeg'},
    {'categoryName': 'Medium', 'categoryImage': 'assets/images/legt.jpeg'},
    {'categoryName': 'moo', 'categoryImage': 'assets/images/base.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.only(left: 5, right: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, FeedsCategoryScreen.id,arguments: '${categories[index]['categoryName']}');
                  },
                  child: Container(
                    height: 180,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage('${categories[index]['categoryImage']}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                /////////222222222222222222222222222222
                Positioned(
                  right: 20,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 254, 253),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 42, 75, 238),
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
            //////////22222222222222222222222222222222222222222222222222222222
            Positioned(
              right: 10,
              left: 10,
              bottom: 0,
              child: Container(
                child: Text(
                  '${categories[index]['categoryName']}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 37, 88, 175)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//     return Stack(
//       children: [
//         Container(
//           width: 150,
//           height: 150,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//               10,
//             ),
//             image: DecorationImage(
//               image: AssetImage('${categories[index]['categoryImage']}'),
// //             ),
//           ),
//         ),
//         Positioned(
//           right: 10,
//           left: 10,
//           bottom: 0,
//           child: Container(
//             child: Text(
//               '${categories[index]['categoryName']}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
