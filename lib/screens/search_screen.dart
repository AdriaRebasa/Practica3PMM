import 'package:flutter/material.dart';
import 'package:movies_app/providers/simpsons_provider.dart';
import 'package:provider/provider.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SimpsonsProvider>(context, listen: false);

    // Executem la primera càrrega després del primer build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.characters.isEmpty && !provider.isLoading) {
        provider.getSimpsonsCharactersByPage(page: 1);
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Simpsons Characters')),
      body: Consumer<SimpsonsProvider>(
        builder: (context, provider, _) {
          final scrollController = ScrollController();

          // Listener per scroll infinit
          scrollController.addListener(() {
            if (scrollController.position.pixels >=
                    scrollController.position.maxScrollExtent - 300 &&
                !provider.isLoading &&
                provider.hasMore) {
              provider.getSimpsonsCharactersByPage(
                  page: provider.currentPage + 1);
            }
          });

          if (provider.characters.isEmpty && provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            controller: scrollController,
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: provider.hasMore
                ? provider.characters.length + 1
                : provider.characters.length,
            itemBuilder: (context, index) {
              if (index >= provider.characters.length) {
                return Center(child: CircularProgressIndicator());
              }

              final character = provider.characters[index];

              return GestureDetector(
                onTap: () {
                  // Navegar al DetailsScreen passant l'id del personatge
                  Navigator.pushNamed(
                    context,
                    'details', // Assegura't que tens la ruta definida
                    arguments: character.id,
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/no-image.jpg'),
                          image: NetworkImage(character.fullPortraitPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      character.name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
