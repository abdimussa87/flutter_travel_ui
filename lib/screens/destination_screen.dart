import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/activity_model.dart';
import 'package:flutter_travel_ui/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({Key key, this.destination}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5),
                      bottom: Radius.circular(30),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.destination.imageUrl),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.sortAmountDown,
                            size: 20,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Venice",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Italy",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                right: 10,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 35,
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 12,
              ),
              child: ListView.builder(
                  itemCount: widget.destination.activities.length,
                  itemBuilder: (context, int index) {
                    Activity activity = widget.destination.activities[index];
                    return Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 110, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 100,
                                        child: Text(
                                          "${activity.name}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text(
                                        "\$${activity.price}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${activity.type}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _buildRatingStars(activity),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      width: 100,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Theme.of(context).accentColor,
                                      ),
                                      child: Text("${activity.startTimes[0]}"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Theme.of(context).accentColor,
                                      ),
                                      child: Text("${activity.startTimes[1]}"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 15,
                          child: Container(
                            height: 140,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                              BoxShadow(
                                
                                color: Colors.grey,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6,
                              ),
                            ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(activity.imageUrl),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildRatingStars(Activity activity) {
    String star = "";
    for (int i = 1; i <= activity.rating; i++) {
      star += "⭐ ";
    }

    return Text(star.trim());
  }
}
