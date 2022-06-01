import 'package:flutter/material.dart';
import 'package:movie_app_flutter/db/temp_db.dart';
import 'package:movie_app_flutter/details_page.dart';
import 'package:movie_app_flutter/new_movie_page.dart';

import 'models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => NewMoviePage())),
            
          )
        ],
      ),

        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          children: movieList.map((movie) => MovieItem(movie: movie)).toList(),
        ));

    //   body: GridView.count(
    //     children:movieList.map((movie) => ListTile(
    //       onTap: (){
    //         Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails(movie)));
    //       },
    //       leading: Image.asset(movie.image!),
    //       title: Text(movie.name!),
    //       subtitle: Text(movie.subTitle!),
    //       trailing: Text((movie.rating).toString())
    //     )).toList(),
    //   ),
    // );
  }
}
class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Hero(
              tag: movie.id!,
              child: Image.asset(
                movie.image!,
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: ElevatedButton(
              onPressed: ()=>
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MovieDetails(movie))),
              child: Text('Details'),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            // bottom: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(22,),topRight: Radius.circular(22,))
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(movie.name!,style: TextStyle(color: Colors.white,fontSize: 25),),
                  Text(movie.subTitle!,style: TextStyle(color: Colors.white70),),
                ],
              ),

            ),
          ),
          Positioned(
            bottom: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star,color: Colors.amber,),
                    Text('${movie.rating}',style: TextStyle(color: Colors.white,fontSize: 18),)
            ],
          ),
              ))
        ],
      ),
    );

  }
}
