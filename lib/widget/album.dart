import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';
import 'package:url_launcher/url_launcher.dart';

class Album extends StatefulWidget {
  final InfoAlbum? infoAlbum;
  const Album({Key? key, this.infoAlbum});

  State<Album> createState() => _AlbumsState();
}

class _AlbumsState extends State<Album> {
  late InfoAlbum infoAlbum;
  @override
  void initState() {

    infoAlbum = widget.infoAlbum!;
    
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(2),

      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Padding(
              padding: EdgeInsets.all(5),
              child:  Image.network(
                      infoAlbum.image,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 200,
                          height: 200,
                          color: Colors.grey[200],
                          alignment: Alignment.center,
                          child: Text("No image found"),
                        );
                      },
                    )
                  ,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      infoAlbum.nom,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(infoAlbum.description),
                    Text(infoAlbum.nomGroupe),
                  ],
                ),
              ),
            ),
            Container(
              child: Column( 
                children: [

                
                Icon(
                infoAlbum.favoriAlbum ? Icons.star : Icons.star_border,
                color: Colors.green,),
                infoAlbum.artisteUrl.isNotEmpty? IconButton(
                        onPressed: () async {
                          final url = Uri.parse(infoAlbum.artisteUrl);
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
                ]
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
