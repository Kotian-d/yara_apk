import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yara/pages/categories.dart';
import 'package:yara/pages/dashboard.dart';
import 'package:yara/pages/login.dart';
import 'package:yara/pages/notifications.dart';
import 'package:yara/pages/qrpage.dart';
import 'package:yara/pages/transactions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  final List pages = [Dashboard(), Categories(), Transactions()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green.shade200,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.account_circle),
              iconSize: 50,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Deekshith S Kotian",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              "9739283261",
              style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton.filled(
                  color: Colors.black,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green.shade50,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notifications()),
                    );
                  },
                  icon: Icon(Icons.notifications_none_outlined),
                ),

                IconButton.filled(
                  color: Colors.black,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green.shade50,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QrGeneratePage()),
                    );
                  },
                  icon: Icon(Icons.qr_code),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: 275,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.teal, Colors.white],
                ),
              ),
              child: Column(
                children: [
                  Icon(Icons.account_circle_rounded, size: 65),
                  Text(
                    "Deekshith S Kotian",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("9739283261"),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/profile");
              },
            ),
            ListTile(
              leading: Icon(Icons.password_outlined),
              title: const Text('Change Password'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/changePasswd");
              },
            ),
            ListTile(
              leading: Icon(Icons.fingerprint_outlined),
              title: const Text('KYC Update'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/kycupdate");
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_outlined),
              title: const Text('Bank Details'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/bankdetails");
              },
            ),
            ListTile(
              leading: Icon(Icons.phone_outlined),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/contact");
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support_sharp),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/about");
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: const Text('Change Language'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/changelang");
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () async {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
                final pref = await SharedPreferences.getInstance();
                await pref.remove("isUserLoggedIn");
                await pref.remove('accessToken');
                await pref.remove('refreshToken');
              },
            ),
          ],
        ),
      ),
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: "categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_outward_outlined),
            label: "Transactions",
          ),
        ],
      ),
    );
  }
}
