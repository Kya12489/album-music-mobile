import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/widget/AppBar.dart';
import 'package:video_player/video_player.dart';

class DetailsAlbum extends StatefulWidget {
  final InfoAlbum album;
  final Function onFavoritePressed;
  const DetailsAlbum({super.key, required this.album,required this.onFavoritePressed});

  @override
  State<DetailsAlbum> createState() => _DetailsAlbumState();
}

class _DetailsAlbumState extends State<DetailsAlbum> {
  late InfoAlbum album;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;


  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.album = widget.album;
    
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
       this.album.ytbUrl,
      ),
    );

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
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
          width: 300, 
          height: 200, 
          child:AspectRatio(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ Image.network(
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
                        );
                      },
                    ),
                 ,
                IconButton(
                  icon: Container(child: Icon(album.favoriAlbum ? Icons.star : Icons.star_border,),color: Colors.green,),
                  color: album.favoriAlbum ? Colors.black : Colors.black,
                  
                  onPressed: (){
                    setState(() {
                      widget.onFavoritePressed(album);
                    });
                    
                  },
                ),],
                ),
                Text(album.nom),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Groupe : ${album.nomGroupe}"),
                        Text("Information Supplementaire"),
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