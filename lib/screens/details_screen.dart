import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/simpsons_provider.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int characterId = ModalRoute.of(context)?.settings.arguments as int;

    final simpsonsProvider =
        Provider.of<SimpsonsProvider>(context, listen: false);

    return FutureBuilder<GetCharactersExpanded>(
      future: simpsonsProvider.getSimpsonsCharactersExpanded(characterId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final character = snapshot.data!;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              _CustomAppBar(character: character),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _PosterAndTitle(character: character),
                    _Overview(character: character),
                    CastingCards(character: character),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final GetCharactersExpanded character;

  const _CustomAppBar({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 255, 247, 176),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            character.name,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(character.fullPortraitPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final GetCharactersExpanded character;
  const _PosterAndTitle({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(character.fullPortraitPath),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: textTheme.headlineSmall,
                ),
                Text(
                  character.age.toString(),
                  style: textTheme.titleMedium,
                ),
                Text(
                  character.occupation,
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final GetCharactersExpanded character;
  const _Overview({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            character.description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Phrases:',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            character.phrases.join('\n'),
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
