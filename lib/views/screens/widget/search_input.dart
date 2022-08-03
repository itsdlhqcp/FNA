import 'package:efotballactseller_app/views/screens/search_screen.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return SearchScreen();
                }));
              },
              readOnly: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 239, 239, 239),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: "Search for Accounts",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/icons/search.png',
                      width: 15,
                    ),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Image.asset(
              'assets/icons/filter.png',
              width: 25,
            ),
          )
        ],
      ),
    );
  }
}
