import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8.0,
      ),
      height: 92,
      color: Colors.black,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Rata tengah dan seimbang
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Pastikan kolom tidak lebih tinggi dari yang diperlukan
              children: [
                Icon(
                  Icons.home_outlined,
                  color: Color.fromARGB(255, 125, 125, 125),
                  size: 32.0,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: Color.fromARGB(255, 125, 125, 125),
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.explore_outlined,
                  color: Color.fromARGB(255, 0, 197, 168),
                  size: 32.0,
                ),
                Text(
                  'Discover',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 197, 168),
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.bookmark_outline_rounded,
                  color: Color.fromARGB(255, 125, 125, 125),
                  size: 32.0,
                ),
                Text(
                  'Bookmark',
                  style: TextStyle(
                    color: Color.fromARGB(255, 125, 125, 125),
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_outline,
                  color: Color.fromARGB(255, 125, 125, 125),
                  size: 32.0,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Color.fromARGB(255, 125, 125, 125),
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
