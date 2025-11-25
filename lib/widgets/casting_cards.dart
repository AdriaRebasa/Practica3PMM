import 'package:flutter/widgets.dart';
import 'package:movies_app/models/models.dart';

class CastingCards extends StatelessWidget {
  final GetCharactersExpanded character;

  const CastingCards({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    // Filtra aparicions no nules
    final aparicions = [
      character.firstAppearanceEp,
      character.firstAppearanceSh
    // ignore: unnecessary_null_comparison
    ].where((e) => e != null).toList();

    if (aparicions.isEmpty) return SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 30, top: 10),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: aparicions.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _CastCard(aparicions[index]!),
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  final FirstAppearance appearance;
  const _CastCard(this.appearance);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      height: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(appearance.fullImagePath),
              height: 140,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5
          ),
          Expanded(
            child: Text(
              appearance.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
