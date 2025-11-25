import 'package:flutter/material.dart';
import 'package:movies_app/models/charactersExpanded_response.dart';
import 'package:movies_app/providers/simpsons_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int characterId;
  const CastingCards(this.characterId);

  @override
  Widget build(BuildContext context) {
    final simpsonsProvider =
        Provider.of<SimpsonsProvider>(context, listen: false);

    return FutureBuilder(
        future: simpsonsProvider.getSimpsonsCharactersExpanded(characterId),
        builder: (BuildContext context,
            AsyncSnapshot<GetCharactersExpanded> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final charactersExpanded = snapshot.data!;
          final aparicions = [
            charactersExpanded.firstAppearanceEp,
            charactersExpanded.firstAppearanceSh
          // ignore: unnecessary_null_comparison
          ].where((e) => e != null).toList();

          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            // color: Colors.red,
            child: ListView.builder(
                itemCount: aparicions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => 
                _CastCard(aparicions[index]!)),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  final FirstAppearance appearance;
  const _CastCard(this.appearance);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 110,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(appearance.fullImagePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            appearance.name,
            maxLines: 2,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
