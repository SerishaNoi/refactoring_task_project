import 'dart:math';
import 'package:eds_test/data/models/hive_models/hive_album_with_photo_model.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final AlbumModelWithPhotos album;

  const AlbumCard({
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    final thumbSize = (mediaQuery - (16 * 2)) / 3;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black45,
        ),
        gradient: LinearGradient(
          colors: [
            Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.4),
            Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(
              width: thumbSize,
              height: thumbSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black45, width: 2),
                image: DecorationImage(
                  image: NetworkImage(
                    album.photos.first.thumbnailUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  album.title,
                  style: AppTextStyles.bodyTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
