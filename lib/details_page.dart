// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_give_aways/models/discount_game.dart';
import 'package:provider/provider.dart';

import 'logic/discount_game_logic.dart';

class DetailsPage extends StatefulWidget {
  DiscountGameModel item;
  DetailsPage(this.item);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Widget build(BuildContext context) {
    List<DiscountGameModel> items =
        context.watch<DiscountGameLogic>().favoriteList;
    bool isFavorite = context.read<DiscountGameLogic>().isFavorite(
          widget.item,
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item.title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        backgroundColor: Color.fromRGBO(29, 37, 53, 1),
        actions: [
          IconButton(
            onPressed: () {
              if (isFavorite) {
                context.read<DiscountGameLogic>().removeFavorite(widget.item);
              } else {
                context.read<DiscountGameLogic>().addFavorite(widget.item);
              }
            },
            icon: isFavorite
                ? Icon(
                    Icons.bookmark_outlined,
                    // color: Colors.red,
                    color: Color.fromRGBO(78, 185, 70, 1),
                  )
                : Icon(Icons.bookmark_outline_sharp),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Color.fromRGBO(36, 45, 60, 1),
      child: ListView(
        children: [
          Image.network(
            widget.item.image,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_alarm,
                      color: Colors.white,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.item.publishedDate.substring(0, 10),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // WidgetSpan(
                          //   child: SizedBox(width: 5),
                          // ),
                          (widget.item.endDate.length) < 5
                              ? TextSpan(
                                  text: ("-${widget.item.endDate}"),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                )
                              : TextSpan(
                                  text: widget.item.endDate.substring(0, 10),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.gamepad,
                      size: 10,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.item.platforms,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      TextSpan(
                        text: 'Type of: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(width: 5),
                      ),
                      (widget.item.type) == "DLC"
                          ? TextSpan(
                              text: "#${widget.item.type}",
                              style: TextStyle(
                                backgroundColor: Colors.cyan,
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : TextSpan(
                              text: "#${widget.item.type}",
                              style: TextStyle(
                                backgroundColor: Colors.green,
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.item.description,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "How to get it ?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.item.instructions,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(78, 185, 70, 1),
                ),
              ),
              onPressed: () {
                print(widget.item.endDate);
              },
              child: Text("GET"),
            ),
          ),
        ],
      ),
    );
  }
}
