import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class MovieSlider extends StatelessWidget {

  final List<Locations> locations;

  const MovieSlider({super.key, required this.locations});
  

  @override
  Widget build(BuildContext context) {

    if (locations.isEmpty) {
      return Container(
        width: double.infinity,
        height: 270,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 270,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Localitzacions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locations.length,
                itemBuilder: (_, int index) => _MoviePoster(location: locations[index])),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Locations location;

  const _MoviePoster({required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details2',
                arguments: location),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(location.fullImagePath),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            location.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
