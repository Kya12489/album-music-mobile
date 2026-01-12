import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/widget/AppBar.dart';
import 'package:video_player/video_player.dart';

class DetailsAlbum extends StatefulWidget {
  final InfoAlbum album;
  final Function onFavoritePressed;

  const DetailsAlbum({super.key, required this.album, required this.onFavoritePressed});

  @override
  State<DetailsAlbum> createState() => _DetailsAlbumState();
}

class _DetailsAlbumState extends State<DetailsAlbum> {
  late InfoAlbum album;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    album = widget.album;
    _controller = VideoPlayerController.network(album.ytbUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar_P(title: "Information sur l'album ${album.nom}"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        width: 300,
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      album.image,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 300,
                          height: 300,
                          color: Colors.grey[200],
                          alignment: Alignment.center,
                          child: const Text('No image found'),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(album.favoriAlbum ? Icons.star : Icons.star_border),
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          widget.onFavoritePressed(album);
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(album.nom),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Groupe : ${album.nomGroupe}"),
                        const SizedBox(height: 8),
                        const Text("Information Supplementaire"),
                        const SizedBox(height: 8),
                        Text(album.description),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
