import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lastest_broo/models/category_model.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Color.fromARGB(238, 247, 245, 240),
      body: ListView(
        children: [
          _textField(),
          _tabBar(),
          SizedBox(
            height: 20,
          ),
          _category(),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.brown, // Warna ikon saat dipilih
        unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Column _category() {
    return Column(
      children: [
        Container(
          height: 510,
          child: ListView.separated(
              itemCount: categories.length,
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 25,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 10,)),
                      Text(
                        categories[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.brown,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              categories[index].date +
                                  '       ' +
                                  categories[index].order,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.brown,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            categories[index].image,
                            height: 150,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(right: 50)),
                              Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.brown,
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                categories[index].quantity,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.brown,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  categories[index].price,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.brown,
                                    fontSize: 11,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  categories[index].weight,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown,
                                    fontSize: 10,
                                  ),
                                ),
                              ])
                        ],
                      )),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 43,
                              width: 230,
                              child: Center(
                                child: Text(
                                  'Track the order',
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(94, 167, 88, 24),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: categories[index].boxColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              }),
        )
      ],
    );
  }

  Column _tabBar() {
    return Column(
      children: [
        DefaultTabController(
            length: 5,
            child: Container(
                margin: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: TabBar(
                  onTap: (selectedTabIndex) {},
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.brown,
                  indicatorSize: TabBarIndicatorSize
                      .tab, // Indikator tetap dengan panjang yang sama
                  labelPadding: EdgeInsets.symmetric(
                      horizontal: 27.0), // Atur margin horizontal untuk label
                  indicatorWeight: 0.1, // Atur ketebalan indikator
                  indicator: BoxDecoration(
                    color: Color.fromARGB(94, 167, 88, 24),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: [
                    Tab(
                      child: Text("   all   "),
                    ),
                    Tab(
                      child: Text("process"),
                    ),
                    Tab(
                      child: Text("sent"),
                    ),
                    Tab(
                      child: Text("cancelled"),
                    ),
                    Tab(
                      child: Text("received"),
                    ),
                  ],
                )))
      ],
    );
  }

  Container _textField() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'search',
            contentPadding: EdgeInsets.all(15),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Bang Udah Bang',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color.fromARGB(0, 214, 210, 210),
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/arrow_back_ios.svg'),
          decoration: BoxDecoration(
            color: Color.fromARGB(0, 214, 210, 210),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
