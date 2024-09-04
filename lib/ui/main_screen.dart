import 'package:api_challanges_skl/model/hoaxes.dart';
import 'package:api_challanges_skl/model/hospitals.dart';
import 'package:api_challanges_skl/model/news.dart';
import 'package:api_challanges_skl/service/covid19_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Color.fromARGB(255, 25, 25, 25)
  // Color.fromARGB(255, 125, 125, 125)
  // Color.fromARGB(255, 0, 197, 168)
  final Future<List<News>?> news = Covid19Api().getNews();
  final Future<List<Hoaxes>?> hoaxes = Covid19Api().getHoaxes();
  final Future<List<Hospitals>?> hospitals = Covid19Api().getHospitals();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 52.0,
                  bottom: 32,
                  right: 16.0,
                  left: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.abc,
                      color: Color.fromARGB(255, 0, 197, 168),
                      size: 40.0,
                    ),
                    Text(
                      'Discover',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'News',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Jost',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 100.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 197, 168),
                                    fontFamily: 'Jost',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 0, 197, 168),
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 440,
                      width: double.infinity,
                      child: FutureBuilder<List<News>?>(
                        future: news,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error: ${snapshot.error}',
                              ),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                              child: Text(
                                'News not found',
                              ),
                            );
                          } else {
                            return SizedBox(
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.0,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/news');
                                    },
                                    child: Container(
                                      width: 300,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      margin: EdgeInsets.only(
                                        top: 24.0,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Container(
                                              height: 216,
                                              width: 300,
                                              child: Image.network(
                                                'https://i.pinimg.com/236x/b2/a7/8b/b2a78b7520577fc3664213e22bffd2c3.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 16.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  height: 100,
                                                  child: Text(
                                                    '${snapshot.data![index].title}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Jost',
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    bottom: 8.0,
                                                  ),
                                                  child: Text(
                                                    DateFormat(
                                                            'EE, MMM dd, yyyy')
                                                        .format(
                                                      DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                        snapshot.data?[index]
                                                                .timestamp ??
                                                            0,
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Jost',
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.share_outlined,
                                                        color: Colors.white,
                                                        size: 20.0,
                                                      ),
                                                      SizedBox(
                                                        width: 16.0,
                                                      ),
                                                      Icon(
                                                        Icons.more_vert,
                                                        color: Colors.white,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Hospitals',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Jost',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 100.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 197, 168),
                                    fontFamily: 'Jost',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 0, 197, 168),
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 220,
                      padding: EdgeInsets.symmetric(
                        vertical: 32.0,
                      ),
                      child: FutureBuilder<List<Hospitals>?>(
                        future: hospitals,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error Setan: ${snapshot.error}',
                              ),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                              child: Text(
                                'Hospitals not found',
                              ),
                            );
                          } else {
                            return Container(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 120,
                                    child: Container(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                40,
                                              ),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                child: Image.network(
                                                  'https://i.pinimg.com/originals/c7/1f/a0/c71fa0ca10f8ae718891f45a1aedebb2.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 12.0,
                                                bottom: 8.0,
                                              ),
                                              child: Text(
                                                '${snapshot.data![index].name}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Jost',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 6.0,
                                                horizontal: 16.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 0, 197, 168),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  16.0,
                                                ),
                                              ),
                                              child: Text(
                                                'Follow',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Jost',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Hoaxes',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Jost',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 100.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 197, 168),
                                    fontFamily: 'Jost',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 0, 197, 168),
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 440,
                      width: double.infinity,
                      child: FutureBuilder<List<Hoaxes>?>(
                        future: hoaxes,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error: ${snapshot.error}',
                              ),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                              child: Text(
                                'Hoaxes not found',
                              ),
                            );
                          } else {
                            return SizedBox(
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.0,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/news');
                                    },
                                    child: Container(
                                      width: 300,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      margin: EdgeInsets.only(
                                        top: 24.0,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Container(
                                              height: 216,
                                              width: 300,
                                              child: Image.network(
                                                'https://joss.co.id/data/uploads/2019/04/hoax.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 16.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  height: 100,
                                                  child: Text(
                                                    '${snapshot.data![index].title}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Jost',
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    bottom: 8.0,
                                                  ),
                                                  child: Text(
                                                    DateFormat(
                                                            'EE, MMM dd, yyyy')
                                                        .format(
                                                      DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                        snapshot.data?[index]
                                                                .timestamp ??
                                                            0,
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Jost',
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.share_outlined,
                                                        color: Colors.white,
                                                        size: 20.0,
                                                      ),
                                                      SizedBox(
                                                        width: 16.0,
                                                      ),
                                                      Icon(
                                                        Icons.more_vert,
                                                        color: Colors.white,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
      ),
    );
  }
}
