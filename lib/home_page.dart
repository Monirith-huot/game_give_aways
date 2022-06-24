// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_give_aways/favorite_page.dart';
import 'package:game_give_aways/models/discount_game.dart';
import 'package:provider/provider.dart';

import 'details_page.dart';
import 'logic/discount_game_logic.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gamerpower"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(29, 37, 53, 1),
      ),
      body: _buildBody(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildBody() {
    List<DiscountGameModel> items =
        context.watch<DiscountGameLogic>().discountGameList;

    return Container(
      color: Color.fromRGBO(36, 45, 60, 1),
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
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
                            color: Color.fromRGBO(78, 185, 70, 1),
                          ),
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
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(36, 45, 60, 1),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(29, 37, 53, 1),
              ),
              accountEmail: Text('hmonirith@gmail.com'),
              accountName: Text('Huot Monirith'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  "lib/image/71109050_2576850605882502_5612247260470444032_n.jpeg",
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: Text(
                'Favorite',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
              title: Text(
                'Log out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildBody() {
  //   List<DiscountGameModel> items =
  //       context.watch<DiscountGameLogic>().discountGameList;
  //   // return Container(
  //   //   child: ListView.builder(
  //   //     itemCount: items.length,
  //   //     itemBuilder: ((context, index) {
  //   //       return
  //   //     }),
  //   //   ),
  //   // );
  // }

  // Widget _buildBody() {
  //   context.read<DiscountGameLogic>().readData();
  //   Status status = context.watch<DiscountGameLogic>().status;
  //   switch (status) {
  //     case Status.none:
  //       print(status);
  //       return Center(
  //         child: Text("None"),
  //       );
  //     case Status.loading:
  //       return Center(
  //         child: Text("Error"),
  //       );
  //     case Status.error:
  //       return Center(
  //         child: Text("error"),
  //       );
  //     case Status.success:
  //       return _buildListView();
  //   }
  // }

  // Widget _buildListView() {
  //   return Container();
  // }
}
