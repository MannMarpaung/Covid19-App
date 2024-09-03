import 'package:api_challanges_skl/service/covid19_api.dart';
import 'package:flutter/material.dart';
import 'package:api_challanges_skl/model/news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final Future<List<News>?> news = Covid19Api().getNews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<News>?>(
          future: news,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error Setan: ${snapshot.error}',
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'Hoaxes not found',
                ),
              );
            } else {
              return Container(
                child: SizedBox(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: Container(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${snapshot.data![index].title}',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),
                                          maxLines: 3,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          child: Text(
                                            'Timestamp : ${snapshot.data![index].timestamp}',
                                            style: TextStyle(
                                              fontFamily: 'Jost',
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${snapshot.data![index].url}',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            fontSize: 8.0,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Image.network(
                                      'https://i.pinimg.com/236x/b2/a7/8b/b2a78b7520577fc3664213e22bffd2c3.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
