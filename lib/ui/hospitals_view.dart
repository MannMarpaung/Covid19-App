import 'package:api_challanges_skl/model/hospitals.dart';
import 'package:api_challanges_skl/service/covid19_api.dart';
import 'package:api_challanges_skl/ui/hospitals_detail_screen.dart';
import 'package:flutter/material.dart';

class HospitalsView extends StatefulWidget {
  const HospitalsView({super.key});

  @override
  State<HospitalsView> createState() => _HospitalsViewState();
}

class _HospitalsViewState extends State<HospitalsView> {
  final Future<List<Hospitals>?> hospitals = Covid19Api().getHospitals();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        8.0,
      ),
      child: FutureBuilder<List<Hospitals>?>(
        future: hospitals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'News not found',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HospitalsDetailScreen(
                            hospitals: snapshot.data![index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 60.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    32.0,
                                  ),
                                  child: Image.network(
                                    'https://i.pinimg.com/originals/c7/1f/a0/c71fa0ca10f8ae718891f45a1aedebb2.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Container(
                                width: 160,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${snapshot.data![index].name}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      '${snapshot.data![index].province}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Jost',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 22.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              24.0,
                            ),
                            color: Color.fromARGB(255, 0, 197, 168),
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
                );
              },
            );
          }
        },
      ),
    );
  }
}
