import 'package:crypto_app/constants/images.dart';
import 'package:crypto_app/providers/bottom_provider.dart';
import 'package:crypto_app/size_config.dart';
import 'package:crypto_app/ui/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatefulWidget {
  final int pageIndex;
  const BottomNavigationWidget({this.pageIndex = 0, super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int press = 0;

  final List<Widget> screenList = [
    const HomeScreen(),
    const HomeScreen(),
    Container(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationProvider>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(h2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: provider.pageIndex,
              elevation: 0,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: f9,
              unselectedFontSize: f9,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
              onTap: (int index) {
                Provider.of<BottomNavigationProvider>(context, listen: false)
                    .setPageIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: Image.asset(
                        Images.shop,
                        height: h2_5,
                        color: provider.pageIndex == 0 ? Colors.white : Colors.grey,
                      ),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: SvgPicture.asset(
                        Images.exchange,
                        height: h2_5,
                        colorFilter: ColorFilter.mode(
                            provider.pageIndex == 1 ? Colors.white : Colors.grey,
                            BlendMode.srcIn),
                      ),
                    ),
                    label: "Categories"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: h1),
                      child: Image.asset(
                        Images.meta,
                        height: h6,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 3),
                      child: SvgPicture.asset(
                        Images.launch,
                        height: h2_5,
                        colorFilter: ColorFilter.mode(
                            provider.pageIndex == 3 ? Colors.white : Colors.grey,
                            BlendMode.srcIn),
                      ),
                    ),
                    label: "Bookings"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: SvgPicture.asset(
                        Images.wallet,
                        height: h2_5,
                        colorFilter: ColorFilter.mode(
                            provider.pageIndex == 4 ? Colors.white : Colors.grey,
                            BlendMode.srcIn),
                      ),
                    ),
                    label: "Account"),
              ],
            ),
          ),
        ),
      ),
      body: screenList[0],
    );
  }
}
