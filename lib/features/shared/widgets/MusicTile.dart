import 'package:flutter/material.dart';
import 'package:bababorg/utils/extensions/SongModelExtension.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicTile extends StatelessWidget {
  final SongModel songModel;

  const MusicTile({
    required this.songModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListTile(
        isThreeLine: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              songModel.title,
              style: TextStyle(
                  fontSize: width / 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              songModel.album.toString(),
              style: TextStyle(fontSize: width / 40),
            )
          ],
        ),
        subtitle: Text(
          songModel.additionalSongInfo,
          style: TextStyle(
              fontSize: width / 40,
              color: Colors.white),
        ),
        trailing: Icon(Icons.more_vert),
        leading: QueryArtworkWidget(
          id: songModel.id,
          type: ArtworkType.AUDIO,
          nullArtworkWidget: const Icon(Icons.music_note),
        ),
      ),
    );
  }
}
