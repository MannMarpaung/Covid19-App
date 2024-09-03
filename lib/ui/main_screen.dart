import 'package:api_challanges_skl/model/news.dart';
import 'package:api_challanges_skl/service/covid19_api.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
// Color.fromARGB(255, 0, 197, 168)
  final Future<List<News>?> news = Covid19Api().getNews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100,
        title: Container(
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
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
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
                    height: 500,
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
                              'Error Setan: ${snapshot.error}',
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
                                horizontal: 8.0,
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
                                    height: 500,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      vertical: 24.0,
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
                                          color: Colors.yellow,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 16.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                color: Colors.green,
                                                height: 100,
                                                child: Text(
                                                  '${snapshot.data![index].title}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Jost',
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 8.0,
                                                ),
                                                child: Text(
                                                  '${snapshot.data![index].timestamp}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Jost',
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
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
    );
  }
}
