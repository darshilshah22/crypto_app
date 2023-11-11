import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/bloc/crypto_bloc/crypto_bloc.dart';
import 'package:crypto_app/constants/color_constants.dart';
import 'package:crypto_app/constants/images.dart';
import 'package:crypto_app/constants/strings.dart';
import 'package:crypto_app/globals/globals.dart';
import 'package:crypto_app/providers/home_provider.dart';
import 'package:crypto_app/size_config.dart';
import 'package:crypto_app/ui/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  CryptoBloc cryptoBloc = CryptoBloc();

  @override
  void initState() {
    cryptoBloc.add(GetCryptoDetailsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: BlocConsumer<CryptoBloc, CryptoState>(
        bloc: cryptoBloc,
        listener: (context, state) {
          if (state is CryptoSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Provider.of<HomeProvider>(context, listen: false)
                  .setCryptoList(state.cryptoList!);
            });
          }
        },
        builder: (context, state) {
          if (state is CryptoSuccessState && provider.cryptoList != null) {
            return Column(
              children: [
                buildAppBar(),
                buildSearchBar(),
                buildBoard(),
                buildTopCryptoCurrency()
              ],
            );
          } else if (state is CryptoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      )),
    );
  }

  Widget buildAppBar() {
    return Container(
      margin: EdgeInsets.only(left: w5, top: h4, right: w5),
      child: Row(
        children: [
          buildText(
              data: Strings.exchange,
              fontSize: f17,
              fontWeight: FontWeight.bold),
          const Spacer(),
          Image.asset(Images.bell, height: h3),
          SizedBox(width: w4),
          Image.asset(Images.setting, height: h3),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      margin: EdgeInsets.only(left: w5, right: w5, top: h2_5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: w4, vertical: h1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: ColorConst.grey.withOpacity(0.05)),
              child: Row(children: [
                Image.asset(Images.search, height: h2),
                SizedBox(width: w4),
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    style: TextStyle(
                      fontSize: f11,
                      color: ColorConst.grey,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Strings.searchCrypto,
                        hintStyle: TextStyle(
                            fontSize: f11,
                            color: ColorConst.grey.withOpacity(0.3))),
                  ),
                )
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(h2),
                          topRight: Radius.circular(h2))),
                  builder: (context) {
                    return buildFilterBottomSheet(context);
                  });
            },
            child: Container(
              margin: EdgeInsets.only(left: w2),
              padding: EdgeInsets.symmetric(horizontal: w4, vertical: h1_5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: ColorConst.grey.withOpacity(0.3)),
                  color: Colors.transparent),
              child: Row(
                children: [
                  Image.asset(Images.filter, height: h1_5),
                  SizedBox(width: w1),
                  buildText(
                      data: Strings.filter,
                      fontSize: f12,
                      color: ColorConst.grey.withOpacity(0.4))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBoard() {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(right: w5, left: w4, top: h2_5),
      child: Column(
        children: [
          Row(
            children: List.generate(2, (index) {
              return GestureDetector(
                onTap: () {
                  Provider.of<HomeProvider>(context, listen: false)
                      .setHeading(types[index]);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: w4),
                  child: buildText(
                      data: types[index],
                      fontSize: f15,
                      color: provider.heading == types[index]
                          ? ColorConst.grey
                          : ColorConst.grey.withOpacity(0.4)),
                ),
              );
            }),
          ),
          Container(
            margin: EdgeInsets.only(top: h2),
            decoration: BoxDecoration(
              color: ColorConst.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: w4, right: w4, top: h4, bottom: h1),
                  child: Row(
                    children: [
                      Image.asset(Images.bitcoin, height: h6),
                      SizedBox(width: w3),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(
                              data: provider.cryptoList!.first.symbol!,
                              fontSize: f14,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: w1),
                          buildText(
                              data: provider.cryptoList!.first.slug!
                                  .toUpperCase(),
                              fontSize: f12_5,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          buildText(
                              data:
                                  "\$${provider.cryptoList!.first.quote!.uSD!.price!.toStringAsFixed(2)} USD",
                              fontSize: f14,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: w2),
                          buildText(
                              data:
                                  "${provider.cryptoList!.first.quote!.uSD!.percentChange24h!.toStringAsFixed(2)} %",
                              fontSize: f12_5,
                              fontWeight: FontWeight.w400,
                              color: ColorConst.green),
                        ],
                      )
                    ],
                  ),
                ),
                Image.asset(Images.design, width: SizeConfig.screenWidth)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTopCryptoCurrency() {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(left: w5, right: w5, top: h3),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(
                    data: Strings.topCrypto,
                    fontSize: f15,
                    color: ColorConst.grey),
                buildText(
                    data: Strings.viewAll,
                    fontSize: f11,
                    color: ColorConst.grey.withOpacity(0.3))
              ],
            ),
            SizedBox(height: h2),
            Flexible(
              child: ListView.builder(
                  itemCount: provider.cryptoList!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index != 0) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: h3),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                                imageUrl: provider.cryptoList![index].logo!,
                                height: h4),
                            SizedBox(width: w3),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildText(
                                    data: provider.cryptoList![index].symbol!,
                                    fontSize: f12,
                                    fontWeight: FontWeight.bold),
                                SizedBox(height: w1),
                                buildText(
                                    data: provider.cryptoList![index].name!
                                        .toUpperCase(),
                                    fontSize: f10,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            SizedBox(width: w3),
                            Image.asset(
                                provider.cryptoList![index].quote!.uSD!
                                        .percentChange24h
                                        .toString()
                                        .contains("-")
                                    ? Images.progress
                                    : Images.progressGreen,
                                height: h2),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                buildText(
                                    data:
                                        "\$${provider.cryptoList![index].quote!.uSD!.price!.toStringAsFixed(2)} USD",
                                    fontSize: f12,
                                    fontWeight: FontWeight.bold),
                                SizedBox(height: w2),
                                buildText(
                                    data:
                                        "${provider.cryptoList![index].quote!.uSD!.percentChange24h!.toStringAsFixed(2)} %",
                                    fontSize: f11,
                                    fontWeight: FontWeight.w400,
                                    color: provider.cryptoList![index].quote!
                                            .uSD!.percentChange24h
                                            .toString()
                                            .contains("-")
                                        ? Colors.red
                                        : ColorConst.green),
                              ],
                            )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFilterBottomSheet(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(left: w6, right: w6, bottom: h3),
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildText(data: "Filter", fontSize: f17, fontWeight: FontWeight.bold),
          GestureDetector(
            onTap: () {
              if (provider.filter.contains(filter[0])) {
                Provider.of<HomeProvider>(context, listen: false)
                    .removeFilter(filter[0]);
              } else {
                Provider.of<HomeProvider>(context, listen: false)
                    .setFilter(filter[0]);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: h2),
              child: Row(
                children: [
                  Icon(
                      provider.filter.contains(filter[0])
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      size: h3),
                  SizedBox(width: w3),
                  buildText(
                      data: filter[0],
                      fontSize: f14,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (provider.filter.contains(filter[1])) {
                Provider.of<HomeProvider>(context, listen: false)
                    .removeFilter(filter[1]);
              } else {
                Provider.of<HomeProvider>(context, listen: false)
                    .setFilter(filter[1]);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: h2),
              child: Row(
                children: [
                  Icon(
                      provider.filter.contains(filter[1])
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      size: h3),
                  SizedBox(width: w3),
                  buildText(
                      data: filter[1],
                      fontSize: f14,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ),
          SizedBox(height: h2),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Provider.of<HomeProvider>(context, listen: false)
                  .filterCryptoList();
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
              Colors.black,
            )),
            child: buildText(data: "Apply", color: Colors.white, fontSize: f12),
          )
        ],
      ),
    );
  }
}
