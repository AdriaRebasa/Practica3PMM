import 'package:flutter/material.dart';
import 'package:movies_app/models/episodi.dart';

class Details3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Canviar després per una instància de Peli
    final Episode episodi =
        ModalRoute.of(context)?.settings.arguments as Episode;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(episodi: episodi),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitile(episodi: episodi),
                _Overview(episodi: episodi),
                //CastingCards(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Episode episodi;

  const _CustomAppBar({super.key, required this.episodi});
  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
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
            '',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(episodi.fullImagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitile extends StatelessWidget {
  final Episode episodi;
  const _PosterAndTitile({super.key, required this.episodi});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${episodi.episodeNumber}. ${episodi.name}',
              style: textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              episodi.airdate,
              style: textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'Season: ${episodi.season}',
              style: textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  final Episode episodi;
  const _Overview({super.key, required this.episodi});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        episodi.synopsis,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
