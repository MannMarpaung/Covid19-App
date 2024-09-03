import 'package:api_challanges_skl/model/stats.dart';
import 'package:api_challanges_skl/service/covid19_api.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final Future<List<Stats>?> stats = Covid19Api().getStats();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
