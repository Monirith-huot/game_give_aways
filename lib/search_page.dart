// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:game_give_aways/logic/discount_game_logic.dart';
import 'package:game_give_aways/models/discount_game.dart';
import 'package:provider/provider.dart';

import 'details_page.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<DiscountGameModel> _items = [];
  List<DiscountGameModel> _foundItems = [];
  @override
  Widget build(BuildContext context) {
    _items = context.watch<DiscountGameLogic>().discountGameList;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(29, 37, 53, 1),
      title: _buildSearchTextField(),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
      onChanged: (text) {
        setState(() {
          if (text == "" || text == " " || text == "  " || text == "   ") {
            _foundItems = [];
          } else {
            _foundItems = _items
                .where(
                  (element) => (element.title.toLowerCase() +
                          element.title.toLowerCase())
                      .contains(
                    text.toLowerCase(),
                  ),
                )
                .toList();
          }
        });
      },
    );
  }

  Widget _buildBody() {
    return Container(
      color: Color.fromRGBO(36, 45, 60, 1),
      child: _buildGridView(),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.55,
      ),
      itemCount: _foundItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 300,
          child: Card(
            color: Color.fromRGBO(36, 45, 60, 0.3),
            child: Column(
              children: [
                Banner(
                  message: "Active",
                  location: BannerLocation.topStart,
                  color: Color.fromRGBO(78, 185, 70, 1),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            _foundItems[index].image,
                          ), //Image.network//RaisedButton
                        ], //<Widget>[]
                      ), //Column
                    ), //Padding
                  ), //Container
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _foundItems[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: new TextSpan(
                    children: [
                      TextSpan(
                        text: _foundItems[index].worth,
                        style: const TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(width: 5),
                      ),
                      TextSpan(
                        text: "\$0",
                        style: const TextStyle(
                            color: Color.fromRGBO(78, 185, 70, 1)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _foundItems[index].platforms,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      _foundItems[index].users.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          _foundItems[index],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Get it now",
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(78, 185, 70, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
