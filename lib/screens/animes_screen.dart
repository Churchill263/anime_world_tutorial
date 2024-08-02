import 'package:anime_world_tutorial/common/styles/paddings.dart';
import 'package:anime_world_tutorial/views/featured_animes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import '../models/anime.dart';
import '../widgets/top_animes_widget.dart';
import 'anime_details_screen.dart';


class AnimesScreen extends StatefulWidget {
  const AnimesScreen({super.key});

  @override
  State<AnimesScreen> createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otaku Oasis'),
        
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            //Featured Animes
            SizedBox(
              height: 300,
              child: TopAnimesList(),
            ),
            
           Padding(
             padding: Paddings.noBottomPadding,
             child: Column(
              children: [
                 //Top Animes
              SizedBox(
                height: 350,
                child: FeaturedAnimes(
                  label: 'Top Ranked',
                  rankingType: 'all',
                ),  
              ),
                   //Top Animes
              SizedBox(
                height: 350,
                child: FeaturedAnimes(
                  label: 'Most Popular',
                  rankingType: 'bypopularity',
                ),  
              ),
                   //Top Animes
              SizedBox(
                height: 350,
                child: FeaturedAnimes(
                  label: 'Top Movies',
                  rankingType: 'movie',
                ),  
              ),
                   //Top Animes
              SizedBox(
                height: 350,
                child: FeaturedAnimes(
                  label: 'Top Favorite',
                  rankingType: 'favorite',
                ),  
              ),
                
              SizedBox(
                height: 350,
                child: FeaturedAnimes(
                  label: 'Top Upcoming',
                  rankingType: 'upcoming',
                ),  
              ),
              ],
             ),
           ),
          ],
        ),
      ),
    );
  }
}

class TopAnimePicture extends StatelessWidget {
  const TopAnimePicture({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AnimeDetailsScreen(
              id: anime.node.id,
            ),
          ),
        );
      },
      splashColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            anime.node.mainPicture.medium,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}