import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_api/core/constants/color_constants.dart';
import 'package:shopping_cart_with_api/presentation/homepage/controller/home_page_controller.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<HomePageController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My cart",
          style: TextStyle(
              color: ColorConstants.textcolor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: providerData.mybox.length,
          itemBuilder: (context, index) {
            var product = providerData.mybox.getAt(index);
            return ListTile(
                contentPadding: EdgeInsets.all(8),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        product['img'],
                      ),
                    ),
                  ),
                ),
                title: Text(
                  product['title'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textcolor),
                ),
                subtitle: Text(
                  "\$${product['price']}",
                  style: TextStyle(
                      color: ColorConstants.textcolor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  onPressed: () {
                    HomePageController().delete(index);
                    setState(() {});
                  },
                  icon: Icon(Icons.delete),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstants.textcolor),
                      iconColor: MaterialStatePropertyAll(
                          ColorConstants.primarycolor)),
                ));
          }),
    );
  }
}
