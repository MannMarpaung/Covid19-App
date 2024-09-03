import 'package:api_challanges_skl/model/hoaxes.dart';
import 'package:api_challanges_skl/service/covid19_api.dart';
import 'package:flutter/material.dart';

class HoaxesScreen extends StatefulWidget {
  const HoaxesScreen({super.key});

  @override
  State<HoaxesScreen> createState() => _HoaxesScreenState();
}

class _HoaxesScreenState extends State<HoaxesScreen> {
  final Future<List<Hoaxes>?> hoaxes = Covid19Api().getHoaxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Hoaxes>?>(
          future: hoaxes,
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
                                      'https://joss.co.id/data/uploads/2019/04/hoax.jpg',
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
