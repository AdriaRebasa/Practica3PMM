import 'package:flutter/material.dart';
import 'package:movies_app/providers/simpsons_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final simpsonsProvider = Provider.of<SimpsonsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Simpsons App'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(personatges: simpsonsProvider.personatges),

              // Slider d'episodis
              EpisodeSlider(episodis: simpsonsProvider.episodis),

              // Slider de localitzacions
              MovieSlider(locations: simpsonsProvider.localitzacions),
            ],
          ),
        ),
      ),
    );
  }
}
