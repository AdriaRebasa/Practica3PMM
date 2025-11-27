import 'package:flutter/material.dart';
import 'package:movies_app/models/locations.dart';

class Details2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Canviar després per una instància de Peli
    final Location localitzacio =
        ModalRoute.of(context)?.settings.arguments as Location;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(location: localitzacio),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitile(location: localitzacio),
                //_Overview(),
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
  final Location location;

  const _CustomAppBar({super.key, required this.location});
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
          image: NetworkImage(location.fullImagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitile extends StatelessWidget {
  final Location location;
  const _PosterAndTitile({super.key, required this.location});
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
              location.name,
              style: textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              location.town,
              style: textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              location.use,
              style: textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ));
  }
}

// class _Overview extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Text(
//         'Labore eiusmod ad reprehenderit irure eu sunt ex minim. Lorem fugiat Lorem proident duis ea cupidatat. Commodo duis culpa reprehenderit ad elit. Velit duis officia reprehenderit ullamco sint id anim officia est. Enim mollit nisi et exercitation dolore commodo. Cillum mollit laborum non nulla cillum non do reprehenderit Lorem deserunt ex eu sunt do.',
//         textAlign: TextAlign.justify,
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//     );
//   }
// }
