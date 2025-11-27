import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class EpisodeSlider extends StatelessWidget {

  final List<Episode> episodis;

  const EpisodeSlider({super.key, required this.episodis});
  

  @override
  Widget build(BuildContext context) {

    if (episodis.isEmpty) {
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
      margin: const EdgeInsets.only(bottom: 30),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Episodes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: episodis.length,
                itemBuilder: (_, int index) => _MoviePoster(episodi: episodis[index])),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Episode episodi;

  const _MoviePoster({required this.episodi});

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
            onTap: () => Navigator.pushNamed(context, 'details3',
                arguments: episodi),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(episodi.fullImagePath),
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
            episodi.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
