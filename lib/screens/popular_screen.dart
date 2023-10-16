import 'package:flutter/material.dart';
import 'package:pmsn20232/models/popular_model.dart';
import 'package:pmsn20232/network/api_popular.dart';
import 'package:pmsn20232/widgets/item_movie.dart';

class PopularScrenn extends StatefulWidget {
  const PopularScrenn({super.key});

  @override
  State<PopularScrenn> createState() => _PopularScrennState();
}

class _PopularScrennState extends State<PopularScrenn> {
  ApiPopular? apiPopular;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Peliculas Populares"),
        ),
        body: FutureBuilder(
            future: apiPopular!.getAllPopular(),
            builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: .9),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return itemMovieWidget(snapshot.data![index], context);
                    });
              } else {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error al cargar los datos"),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            }));
  }
}
