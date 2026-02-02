import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/screens/formulaireAlbum.dart';
import 'package:tp2/widget/AppBar.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsAlbum extends StatefulWidget {
  final InfoAlbum album;
  final Function onFavoritePressed;
  
  const DetailsAlbum({
    super.key, 
    required this.album,
    required this.onFavoritePressed
  });

  @override
  State<DetailsAlbum> createState() => _DetailsAlbumState();
}

class _DetailsAlbumState extends State<DetailsAlbum> {
  YoutubePlayerController? _controller;
  String? _videoId;

  @override
  void initState() {
    super.initState();
    
    // Extract video ID from YouTube URL using the correct method
    _videoId = YoutubePlayerController.convertUrlToId(widget.album.ytbUrl);
    
    // Initialize controller with fromVideoId constructor if we have an id
    if (_videoId != null) {
      _controller = YoutubePlayerController.fromVideoId(
        videoId: _videoId!,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.close(); // Use close() instead of dispose() for youtube_player_iframe
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar_P(title: "Information sur l'album ${widget.album.nom}"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
                
                const SizedBox(height: 16),
                
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.album.image,
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
                    Column(
                      children: [
                        IconButton(
                      icon: Icon(
                        widget.album.favoriAlbum ? Icons.star : Icons.star_border,
                      ),
                      color: Colors.green,
                      iconSize: 32,
                      onPressed: () {
                        setState(() {
                          widget.onFavoritePressed(widget.album);
                        });
                      },
                    ),
                    widget.album.artisteUrl.isNotEmpty
                    ? IconButton(
                        onPressed: () async {
                          final url = Uri.parse(widget.album.artisteUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        
                        icon: const Icon(Icons.web),
                        color: Colors.green,
                      )
                    : Icon(
                        
                        
                        Icons.web,
                        color: Colors.grey,
                      ),
                      IconButton(
                    icon: Icon(widget.album.favoriAlbum ? Icons.edit : Icons.edit_outlined),
                    color: Colors.green,
                    onPressed: (){
                       
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FormulaireAlbum(infoAlbum: widget.album,),
                                  ),
                                );
                      
                      
                    },
                  ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
                
                // Album Name
                Text(
                  widget.album.nom,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Album Information
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Groupe : ${widget.album.nomGroupe}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Information Supplémentaire",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.album.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _videoId != null? YoutubePlayer(
                  controller: _controller!,
                  aspectRatio: 16 / 9, // Required parameter
                ) : const Text('La vidéo YouTube est indisponible.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}