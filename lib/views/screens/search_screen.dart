import 'package:efotballactseller_app/models/products.dart';
import 'package:efotballactseller_app/views/screens/provider/products.dart';
import 'package:efotballactseller_app/views/screens/widget/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchList = [];
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 228, 228, 228),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 228, 228, 228),
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
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                _searchController.clear();
              },
              child: Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
          ),
          onChanged: (value) {
            _searchController.text.toLowerCase();

            setState(() {
              _searchList = productData.searchQuery(_searchController.text);
            });
          },
        ),
        centerTitle: true,
      ),
      body: _searchList.isEmpty
          ? Center(
              child: Text(
                'Search for Products',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 240 / 320,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(
                _searchList.length,
                (index) => ChangeNotifierProvider.value(
                  value: _searchList[index],
                  child: FeedsProduct(),
                ),
              ),
            ),
    );
  }
}
