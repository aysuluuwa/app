import 'package:flutter/material.dart';

final _backgroundColor = Colors.black87;

class ClientWishlist extends StatefulWidget{
  ClientWishlist({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _ClientWishlistState createState() => _ClientWishlistState();
}

class _ClientWishlistState extends State<ClientWishlist>{

  TextStyle textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white);

  Widget _buildClientWishlistWidgets(BuildContext context){

    bool _selected = true;
    final starButton = IconButton(
        icon: Icon(_selected? Icons.star: Icons.star_outline),
        color: Colors.white,
        onPressed: () {
          setState(() {
            _selected = !_selected;
            });
        },
    );

    final itemCard = Row(
      children: <Widget> [
        starButton,
      ],
    );

    return starButton;

  }

  @override
  Widget build(BuildContext context){

    final clientWishlist = Container(
      color: _backgroundColor,
      child: _buildClientWishlistWidgets(context),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        iconTheme: IconThemeData(
          color: Colors.amber,
        ),
        backgroundColor: _backgroundColor,
      ),

      body: clientWishlist,
    );

  }
}
