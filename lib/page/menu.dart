import 'package:e_commerce/page/pelaporan/list_pelaporan.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Color(0xffF18265)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ListPelaporan()));
          },
          child: Text(
            "Pelaporan",
          ),
        ),
      ),
    );
  }
}
