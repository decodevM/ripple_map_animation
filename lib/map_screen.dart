import 'package:flutter/cupertino.dart';

import 'custom_card.dart';
import 'location_indicator.dart';
import 'place_model.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);
  List<PlaceModel> places = [
    PlaceModel(
        id: 1,
        name: 'Tlemcen, Algeria',
        distance: 10,
        rating: 4,
        image: 'tlemcen.jpeg'),
    PlaceModel(
        id: 2,
        name: 'Oran, Algeria',
        distance: 157,
        rating: 3,
        image: 'oran.jpeg'),
    PlaceModel(
        id: 3,
        name: 'Algiers, Algeria',
        distance: 542,
        rating: 5,
        image: 'algeirs.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: places.length,
                    itemBuilder: (_, int index) => CustomCard(
                      place: places[index],
                    ),
                  ),
                )
              ],
            ),
          ),
          const LocationIndicator(
            top: 350,
            left: 300,
            placeName: 'Algeirs',
          ),
          const LocationIndicator(
            top: 330,
            left: 130,
            placeName: 'Oran',
          ),
          const LocationIndicator(
            top: 450,
            left: 20,
            placeName: 'Tlemcen',
          ),
        ],
      ),
    );
  }
}
