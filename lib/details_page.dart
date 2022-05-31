import 'package:flutter/material.dart';

import 'models/models.dart';

class MovieDetails extends StatefulWidget{
  final Movie movie;
  MovieDetails(this.movie);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:[
          SliverAppBar(
            floating: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.movie.name!),
              background: Image.asset(
                widget.movie.image!,
                width: double.maxFinite,
                height: 300,
                fit: BoxFit.cover,

            ),
          ),
        ),
          SliverList(
              delegate: SliverChildListDelegate([
                ListTile(

                  title: Text(widget.movie.name!),
                  subtitle: Text(widget.movie.subTitle!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star),
                      Text('${widget.movie.rating}')
                    ],
                  ),
                  tileColor: Colors.grey.shade300,
                )
              ]),
          )
        ],
      ),
    );
  }
}
