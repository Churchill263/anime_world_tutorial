import 'package:anime_world_tutorial/common/styles/text_styles.dart';
import 'package:anime_world_tutorial/models/anime_node.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AnimeTitle extends StatelessWidget {
  const AnimeTitle({
    super.key,
    required this.anime,
    });

  final AnimeNode anime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: anime.mainPicture.medium,
              fit: BoxFit.cover,
              height: 200,
              ),
          ),

          const SizedBox(height: 10),

          Text(
            anime.title,
            maxLines: 3,
            style: TextStyles.mediumText,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}