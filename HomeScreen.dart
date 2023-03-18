import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final RefreshController refreshController = RefreshController(initialRefresh: false);
  String childData = 'Normal Child Data (Capcicum)';
  String imageData = 'assets/capcicum.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        onRefresh: onRefresh,
        controller: refreshController,
        enablePullDown: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageData, height: 100, width: 100,),
              const SizedBox(height: 10.0,),
              Text(childData),
            ],
          ),
        ),
        // footer: Text(footerData),
      ),
    );
  }

  void onRefresh() async {
    childData = 'Child Data After Refresh (Tomato)';
    imageData = 'assets/tomato.png';
    await Future.delayed(Duration(seconds: 1));
    refreshController.refreshCompleted();
    // Remove this set state if you're updating data from api.
    // I have used it because I wasn't using any api to update my data.
    setState(() {});
  }
}
