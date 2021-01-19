import 'package:flutter/material.dart';

class MyFavoriteWidget extends StatefulWidget {
  final void Function(bool isFavorite) onFavoriteChanged;
  final bool isFavorite;

  const MyFavoriteWidget({Key key, this.onFavoriteChanged, this.isFavorite})
      : super(key: key);
  @override
  _MyFavoriteWidgetState createState() => _MyFavoriteWidgetState();
}

class _MyFavoriteWidgetState extends State<MyFavoriteWidget> {
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      widget.onFavoriteChanged(isFavorited);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
      child: IconButton(
        icon: isFavorited ? Icon(Icons.favorite,size: 30.0,) : Icon(Icons.favorite_border,size: 30.0,),
        color: Colors.pink,
        onPressed: toggleFavorite,
      ),
    );
  }
}
