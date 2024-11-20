import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Model App"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 9.0,
          crossAxisSpacing: 9.0,
          children: _cardTile,
        ),
      ),
    );
  }
}

List<StaggeredGridTile> _cardTile = [
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: BackGroundTile(imagePath: 'assets/image1.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image2.jpg'),
  ),
   const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: BackGroundTile(imagePath: 'assets/image3.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image4.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 3,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image7.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image5.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image6.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(imagePath: 'assets/image8.jpg'),
  ),
];

class BackGroundTile extends StatelessWidget {
  final String imagePath;

  const BackGroundTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
