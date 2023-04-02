import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app_ui/MyCards.dart';
import 'package:wallet_app_ui/style.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String date = DateFormat('dd MMM yyyy').format(DateTime.now());
  int selectedIndex = 0;

  // page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFC8C8D8),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFf7f7f8),
            height: height * 0.42,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.32,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1319c4),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * 0.054,
                            // left: 270,
                            right: height * 0.09,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Container(
                                height: 40,
                                width: 40,
                                // color: Color(0xFFc63f53),
                                child: const Icon(
                                  Icons.notifications,
                                  size: 25,
                                  color: Color(0xFFb4b6c1),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.054,
                            left: width * 0.036,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    'Welcome back,',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFb4b6c1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    'Harry Oliver',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFf7f7f8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: height * 0.054,
                            // left: 310,
                            right: 15,
                            child: const CircleAvatar(
                              // radius: 20,
                              backgroundColor: Color(0xFFf7f7f8),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Color(0xFFdfafb4),
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: height * 0.144,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: height * 0.235,
                    width: width * 0.84,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      children: [
                        MyCards(
                          balance: '6,400.00',
                          paymentMethod: 'PayPal',
                          date: date,
                          gradient: activeGradientOne,
                          textColor: Color(0xFFf7f7f8),
                          description: 'up by 2% from last month',
                        ),
                        MyCards(
                          balance: '4,200.00',
                          paymentMethod: 'Visa',
                          date: date,
                          gradient: activeGradientTwo,
                          textColor: Color(0xFF473b48),
                          description: 'down by 6% from last month',
                        ),
                        MyCards(
                          balance: '2,400.00',
                          paymentMethod: 'MasterCard',
                          date: date,
                          gradient: activeGradientThree,
                          textColor: Color(0xFFf7f7f8),
                          description: 'up by 15% from last month',
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.395,
                  left: 100,
                  right: 100,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const WormEffect(
                        spacing: 3.0,
                        // radius: 2.0,
                        dotWidth: 6.0,
                        dotHeight: 6.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1319c4),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                // gradient: gradient,
                color: const Color(0xFFf7f7f8),
                borderRadius: BorderRadius.circular(10),
              ),
              height: height * 0.195,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          // minVerticalPadding: 30,
                          minLeadingWidth: 20,
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: activeGradientOne,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.water_drop_sharp,
                              color: Color(0xFFf7f7f8),
                            ),
                          ),
                          title: const Text(
                            'Dropbox Plan',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Subscription',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFb4b6c1),
                            ),
                          ),
                          trailing: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFF9EFEE),
                              border: Border.all(
                                color: Color(0xFFdfafb4),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '- \$184.00',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          // minVerticalPadding: 30,
                          minLeadingWidth: 20,
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: activeGradientOne,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.music_note_rounded,
                              color: Color(0xFFf7f7f8),
                            ),
                          ),
                          title: const Text(
                            'Spotify Subscr.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Subscription',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFb4b6c1),
                            ),
                          ),
                          trailing: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFF9EFEE),
                              border: Border.all(
                                color: Color(0xFFdfafb4),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '- \$64.00',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: height * 0.018,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                // gradient: gradient,
                color: const Color(0xFFf7f7f8),
                borderRadius: BorderRadius.circular(10),
              ),
              height: height * 0.195,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          // minVerticalPadding: 30,
                          minLeadingWidth: 20,
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: activeGradientOne,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.ondemand_video_sharp,
                              color: Color(0xFFf7f7f8),
                            ),
                          ),
                          title: const Text(
                            'Youtube Ads.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Income',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFb4b6c1),
                            ),
                          ),
                          trailing: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 238, 249, 238),
                              border: Border.all(
                                color: Color.fromARGB(255, 179, 223, 175),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '+ \$72.00',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          // minVerticalPadding: 30,
                          minLeadingWidth: 20,
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: activeGradientOne,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Color(0xFFf7f7f8),
                            ),
                          ),
                          title: const Text(
                            'Freelance Work',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Income',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFb4b6c1),
                            ),
                          ),
                          trailing: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 238, 249, 238),
                              border: Border.all(
                                color: Color.fromARGB(255, 179, 223, 175),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '+ \$821.00',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            // _selectedDrawerIndex = index;
            // _onSelectItem(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return activeGradientOne.createShader(bounds);
              },
              child: const Icon(
                Icons.home_filled,
              ),
            ),
            icon: const Icon(
              Icons.home_filled,
              color: Color(0xFFb4b6c1),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return activeGradientOne.createShader(bounds);
              },
              child: const Icon(Icons.bar_chart_rounded),
            ),
            icon: const Icon(
              Icons.bar_chart_rounded,
              color: Color(0xFFb4b6c1),
            ),
            label: 'Graph',
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return activeGradientOne.createShader(bounds);
              },
              child: const Icon(Icons.credit_card_rounded),
            ),
            icon: const Icon(
              Icons.credit_card_rounded,
              color: Color(0xFFb4b6c1),
            ),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return activeGradientOne.createShader(bounds);
              },
              child: const Icon(Icons.person),
            ),
            icon: const Icon(
              Icons.person,
              color: Color(0xFFb4b6c1),
            ),
            label: 'Person',
          ),
        ],
      ),
    );
  }
}
