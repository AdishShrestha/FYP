import 'package:flutter/material.dart';
import 'package:rent_room/models/room.dart';
import 'package:rent_room/widgets/constants.dart';

class PopularPlaceCard extends StatelessWidget {
  final Room room;
  PopularPlaceCard({this.room});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 90.0,
            height: 90.0,
            margin: EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 12.0,
                  bottom: 12.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      room.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: kBlue,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 10.0,
                            color: kWhite,
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            room.rating,
                            style: KRatingstyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(room.name, style: KTitlestyle, maxLines: 1),
                  Text(room.place, style: KSubtitlestyle),
                  Row(
                    children: <Widget>[
                      Text(
                        "${room.width}ft | ${room.height}ft",
                        maxLines: 1,
                        style: KSubtitlestyle.copyWith(
                          color: kBlack.withOpacity(1.0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\ ${room.price} ",
                        style: KTitlestyle.copyWith(
                          color: Color.fromRGBO(110, 46, 70, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
