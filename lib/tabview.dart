import 'package:flutter/material.dart';

class TabView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            // title: const Text('Chess Day Stalls'),
            bottom: const TabBar(
// indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.home, color: Colors.white),
                  child: Text('Shandu\'s Fat Cakes',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.account_balance, color: Colors.white),
                  child: Text('Inyama Yenhloko',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.calculate, color: Colors.white),
                  child: Text('Mbhako and Desserts',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.credit_score, color: Colors.white),
                  child: Text('Soup Kitchen',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SizedBox(
                child: Center(
                  child: Text('Home Page Tab 1'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Account Page Tab 2'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Payments Page Tab 3'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Card Page Tab 4'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
