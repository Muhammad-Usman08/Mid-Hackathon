import 'package:flutter/material.dart';
import 'package:myapp/component/buttons/mybutton.dart';
import 'package:myapp/list.dart';
import 'package:myapp/screens/cart/cart_view.dart';
import 'package:myapp/screens/home/widget/heading.dart';
import 'package:myapp/screens/product/widget/container.dart';

class ProductDetail extends StatelessWidget {
  final Map product;
  const ProductDetail({super.key, required this.product});

  addItems() {
    selectedItems.add({
      'productName': '${product['productName']}',
      'productImage': '${product['productImage']}',
      'productPrice': '${product['productPrice']}',
      'quantity': 1,
    });

    // ignore: avoid_print
    print(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Product Detail',
          style: TextStyle(fontSize: 18),
        )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(Icons.trolley))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                      child: Image.asset(
                        '${product['productImage']}',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 20, top: 10),
                            child: Heading(text: '${product['productName']}')),
                      ],
                    ),
                    Text(
                      'Rs.${product['productPrice']}',
                      style: const TextStyle(
                          color: Color(0xffAA14F0),
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: const Heading(text: "Color"),
              ),
              Row(
                children: [
                  const CustomContainer(
                    color: Colors.red,
                  ),
                  CustomContainer(
                    color: Colors.blue[800],
                    margin: const EdgeInsets.only(left: 20),
                  ),
                  const CustomContainer(
                    color: Colors.black,
                    margin: EdgeInsets.only(left: 20),
                  ),
                  const CustomContainer(
                    color: Colors.grey,
                    margin: EdgeInsets.only(left: 20),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Heading(text: 'About')),
              Text(
                'Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: MyButton(
                    buttonText: 'Add to Cart',
                    onpressed: () {
                      addItems();
                    },
                    value: 18,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
