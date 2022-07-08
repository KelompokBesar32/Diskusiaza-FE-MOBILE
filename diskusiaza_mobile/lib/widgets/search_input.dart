import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Cari di Diskusiaza',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.search),
                        width: 18,
                      )),
                ),
              ),
              // Container(
              //     margin: EdgeInsets.only(left: 10),
              //     padding: EdgeInsets.all(15),
              //     decoration: BoxDecoration(
              //         color: Theme.of(context).primaryColor,
              //         borderRadius: BorderRadius.circular(15)),
              //     child: Icon(Icons.search),
              //     width: 25),
            ],
          )
        ],
      ),
    );
  }
}
