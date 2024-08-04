import 'package:flutter/material.dart';
import 'package:myapp/component/buttons/mybutton.dart';
import 'package:myapp/list.dart';
import 'package:myapp/screens/cart/widget/charges.dart';
import 'package:myapp/screens/home/widget/heading.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //deleteItem
  deleteItem(index) {
    selectedItems.removeAt(index);
    setState(() {});
  }

  //total function
  calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in selectedItems) {
      int price = int.parse(item['productPrice']);
      int quantity = item['quantity'];
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  //subtotal
  subTotal() {
    int totalPrice = calculateTotalPrice();
    if (totalPrice != 0) {
      return totalPrice - 300;
    } else {
      return totalPrice;
    }
  }

  //Increase quantity of item
  increaseItem(index) {
    selectedItems[index]['quantity']++;
    setState(() {});
  }

  // decrease quantity of item
  removeItems(index) {
    setState(() {
      if (selectedItems[index]['quantity'] != 0) {
        selectedItems[index]['quantity']--;
      } else if (selectedItems[index]['quantity'] == 0) {
        selectedItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var totalPrice = calculateTotalPrice();
    var total = subTotal();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Center(
          child: Text('Cart'),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Items
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 130, // Increased height to prevent overflow issues
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  selectedItems[index]['productName'],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow
                                      .ellipsis, // Handles overflowed text
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Rs.${selectedItems[index]['productPrice'].toString()}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffAA14F0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        removeItems(index);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 12,
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    Text(
                                      '${selectedItems[index]['quantity']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        increaseItem(index);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 12,
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[300],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                selectedItems[index]['productImage'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              deleteItem(index);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              ),
            ),
            paymentSummary('${selectedItems.length}', "Selected Items:"),
            paymentSummary('$totalPrice', "SubTotal:"),
            paymentSummary('300', "Discount"),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Heading(text: 'Total'),
                Text(
                  '$total',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffAA14F0)),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: const Center(
                  child: MyButton(buttonText: 'Checkout', value: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
