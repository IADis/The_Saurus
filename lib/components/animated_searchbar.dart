import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool folder = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      width: folder ? 56 : 350,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          32,
        ),
        color: Colors.blue,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: !folder
                  ? const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    )
                  : null,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(folder ? 32 : 0),
                  topRight: const Radius.circular(32),
                  bottomLeft: Radius.circular(folder ? 32 : 0),
                  bottomRight: const Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    folder ? Icons.search : Icons.close,
                    color: folder ? Colors.blue[900] : Colors.red,
                  ),
                ),
                onTap: () {
                  setState(
                    () {
                      folder = !folder;
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
