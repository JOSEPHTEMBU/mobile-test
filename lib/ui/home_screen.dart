import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/bloc/authentication_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeContent(),
    SearchScreen(),
    TransactionScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Home'),
        actions: [
          Icon(Icons.notifications),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(color: Colors.green, fontSize: 16),
        items: [
          BottomNavigationBarItem(
            icon:
                Image.asset('assets/images/Home 1.png', height: 24, width: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Search 1.png',
                height: 24, width: 24),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Transaction 1.png',
                height: 24, width: 24),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Profile 1.png',
                height: 24, width: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, Jessie.',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20), // Add some spacing
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Text(
                  'Welcome, ${state.user.displayName ?? state.user.email}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              }
              return Container();
            },
          ),
          SizedBox(height: 20), // Add some spacing before the carousel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Best Plans',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Add your onTap logic here
                },
                child: Row(
                  children: [
                    const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.red,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Spacing between title and cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/gold.png',
                height: 120,
                width: 100,
              ),
              Image.asset(
                'assets/images/silver.png',
                height: 120,
                width: 100,
              ),
              Image.asset(
                'assets/images/platinum.png',
                height: 135,
                width: 100,
              ),
            ],
          ),
          SizedBox(height: 20), // Add some spacing before the Investment Guide
          _buildInvestmentGuide(),
        ],
      ),
    );
  }

  Widget _buildInvestmentGuide() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Investment Guide',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Basic type of investment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'This is how you set your foot for 2020 Stock market recession. What’s next...',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'How much can you start wit..',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              Padding(
                padding:
                    EdgeInsets.all(8.0), // Spacing between text and description
                child: Text(
                  'What do you like to see? It’s a very different market from 2018. The way...',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.0), // Add spacing between description and circle
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.orange, // Color of the circle
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen'),
    );
  }
}

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Transaction Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
