import 'package:flutter/material.dart';
import 'package:shopping_cart_with_api/core/constants/color_constants.dart';
import 'package:shopping_cart_with_api/presentation/addto_cart_screen/view/addto_cart_screen.dart';
import 'package:shopping_cart_with_api/presentation/homepage/controller/home_page_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.descreiption});
  final String title;
  final String price;
  final String image;
  final String descreiption;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(
              color: ColorConstants.textcolor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorConstants.primarycolor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.containercolor),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.fill,
                        height: 350,
                        width: 300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                maxLines: 3,
                widget.title,
                style: TextStyle(
                    color: ColorConstants.textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "\$${widget.price}",
              style: TextStyle(
                  color: ColorConstants.textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                widget.descreiption,
                style: TextStyle(
                    color: ColorConstants.textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AddToCartScreen(),
                  ),
                );

                HomePageController().addData(
                    title: widget.title,
                    img: widget.image,
                    price: widget.price);
              },
              child: Text(
                "Add To Cart",
                style: TextStyle(color: ColorConstants.primarycolor),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorConstants.textcolor)),
            ),
          ],
        ),
      ),
    );
  }
}
