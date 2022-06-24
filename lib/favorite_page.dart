import 'package:flutter/material.dart';
import 'package:game_give_aways/models/discount_game.dart';
import 'package:provider/provider.dart';

import 'details_page.dart';
import 'logic/discount_game_logic.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 37, 53, 1),
        title: Text("Favorite"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Color.fromRGBO(36, 45, 60, 1),
      child: _buildGridView(),
    );
  }

  Widget _buildGridView() {
    List<DiscountGameModel> items =
        context.watch<DiscountGameLogic>().favoriteList;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.55,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        bool isFavorite = context.read<DiscountGameLogic>().isFavorite(
              items[index],
            );
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
                            items[index].image,
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
                    items[index].title,
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
                        text: items[index].worth,
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
                  items[index].platforms,
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
                      items[index].users.toString(),
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
                          items[index],
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
