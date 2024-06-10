import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_api/core/constants/color_constants.dart';
import 'package:shopping_cart_with_api/presentation/addto_cart_screen/view/addto_cart_screen.dart';
import 'package:shopping_cart_with_api/presentation/homepage/controller/home_page_controller.dart';
import 'package:shopping_cart_with_api/presentation/homepage/view/detail_page.dart';
import 'package:shopping_cart_with_api/presentation/homepage/view/widget/refaterd_tex.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getdata();

    super.initState();
  }

  getdata() async {
    await Provider.of<HomePageController>(context, listen: false).fetchdata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<HomePageController>(context);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Text(
            "Shopping cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.search,
                color: ColorConstants.iconcolor,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToCartScreen(),
                      ));
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: ColorConstants.textcolor,
                ))
          ],
        ),
        body: providerData.isloding
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  RefacterdText(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: providerData.apiarticles?.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                      mainAxisExtent: 270),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        descreiption: providerData
                                                .apiarticles?[index]
                                                .description ??
                                            "",
                                        image: providerData
                                                .apiarticles?[index].image ??
                                            "",
                                        title: providerData
                                                .apiarticles?[index].title ??
                                            "",
                                        price: providerData
                                                .apiarticles?[index].price
                                                .toString() ??
                                            "",
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstants.containercolor,
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Image.network(
                                                providerData.apiarticles?[index]
                                                        .image ??
                                                    "",
                                                fit: BoxFit.contain,
                                                height: 200,
                                                width: 200,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.favorite_outline,
                                                      color: ColorConstants
                                                          .iconcolor,
                                                      weight: 3,
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 17),
                                                  child: Container(
                                                    height: 30,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        color: ColorConstants
                                                            .primarycolor),
                                                    child: Center(
                                                      child: Text(
                                                        providerData
                                                                .apiarticles?[
                                                                    index]
                                                                .rating
                                                                ?.rate
                                                                .toString() ??
                                                            "",
                                                        style: TextStyle(
                                                            color:
                                                                ColorConstants
                                                                    .textcolor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 19),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                maxLines: 1,
                                                providerData.apiarticles?[index]
                                                        .title ??
                                                    "",
                                                // providerData.apiarticles?[index].title ?? "",
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .textcolor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19),
                                              ),
                                              Text(
                                                "\$${providerData.apiarticles?[index].price.toString() ?? ""}",
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .textcolor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
