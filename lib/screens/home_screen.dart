import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/destination_model.dart';
import 'package:flutter_travel_ui/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentBNBIndex = 0;
  List<Icon> _icons = [
    Icon(
      Icons.airplanemode_active,
    ),
    Icon(
      Icons.train,
    ),
    Icon(
      Icons.landscape,
    ),
    Icon(
      Icons.directions_bike,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 120),
                child: Text(
                  "What you would like to find?",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _icons
                      .asMap()
                      .entries
                      .map(
                        (MapEntry map) => _buildIcon(map.key),
                      )
                      .toList(),
                ),
              ),
              DestinationCarousel(),
              HotelCarousel(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBNBIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_empty),
            title: SizedBox.shrink(),
          ),
          
        ],
        onTap: (index){
          setState(() {
            _currentBNBIndex=index;
          });
        },
      ),
    );
  }

  Widget _buildIcon(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: _selectedIndex == index
            ? Theme.of(context).accentColor
            : Colors.grey[200],
      ),
      child: IconButton(
        icon: _icons[index],
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        color: _selectedIndex == index
            ? Theme.of(context).primaryColor
            : Colors.grey,
      ),
    );
  }
}
