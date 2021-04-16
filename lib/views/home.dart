import 'package:flutter/material.dart';
import 'package:rent_room/models/room.dart';
import 'package:rent_room/widgets/constants.dart';
import 'package:rent_room/widgets/popular_place_card.dart';
import 'package:rent_room/widgets/recommended_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownPrice = '4000';
  String dropdownFilter = 'Sort By: Price';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(122.0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "My Location",
                    style: KSubtitlestyle.copyWith(height: 2.0),
                  ),
                  subtitle: Text(
                    "Pokhara, Nepal",
                    style: KTitlestyle.copyWith(height: 1.5),
                  ),
                  trailing: Icon(Icons.notifications, color: kBlack),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 25.0),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: DropdownButton(
                          value: dropdownPrice,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 20.0,
                            color: kBlack.withOpacity(.5),
                          ),
                          underline: Container(),
                          onChanged: (String price) {
                            setState(() {
                              dropdownPrice = price;
                            });
                          },
                          items: ["3000", "3500", "4000", "5000", "6000"]
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                        )),
                    SizedBox(height: 8.0),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: DropdownButton(
                          value: dropdownFilter,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 20.0,
                            color: kBlack.withOpacity(.5),
                          ),
                          underline: Container(),
                          onChanged: (String filter) {
                            setState(() {
                              dropdownFilter = filter;
                            });
                          },
                          items: [
                            "Sort By: Price",
                            "Sort By: Name",
                            "Sort By: Location",
                            "Sort By: Type"
                          ]
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                        )),
                  ],
                )
              ],
            ),
          )),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              Container(
                width: double.infinity,
                height: 340.0,
                child: ListView.builder(
                  itemCount: roomList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var room = roomList[index];
                    return RecommendedCard(room = room);
                  },
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ListTile(
                title: Text(
                  "Popular Places",
                  style: KTitlestyle,
                ),
                trailing: Text(
                  "View All",
                  style: KTrailingstyle,
                ),
              ),
              ListView.builder(
                itemCount: roomList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var room = roomList[index];
                  return PopularPlaceCard(room: room);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
