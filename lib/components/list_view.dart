import 'package:flutter/material.dart';

class ContainerList extends StatelessWidget {
  final String text;
  final dynamic image;
  final dynamic route;

  const ContainerList(
      {Key? key, required this.text, required this.image, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
          child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffCAB097),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(text),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
