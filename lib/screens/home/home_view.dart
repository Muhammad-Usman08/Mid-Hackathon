import 'package:flutter/material.dart';
import 'package:myapp/component/container/container.dart';
import 'package:myapp/list.dart';
import 'package:myapp/screens/home/widget/categories.dart';
import 'package:myapp/screens/home/widget/heading.dart';
import 'package:myapp/screens/product/product_detail.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedCategory = "All";

  addFavItems(product) async {
    int productIndex = products.indexWhere((p) => p['id'] == product['id']);
    if (products[productIndex]['isFav'] == true) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        products[productIndex]['isFav'] = false;
        Faviourite.removeWhere((item) =>
            item['productImage'] == products[productIndex]['productImage']);
      });
    } else {
      setState(() {
        products[productIndex]['isFav'] = true;
        Faviourite.add({
          'productImage': '${products[productIndex]['productImage']}',
          'productPrice': '${products[productIndex]['productPrice']}',
          'productName': '${products[productIndex]['productName']}',
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List filteredProducts = selectedCategory == "All"
        ? products
        : products.where((product) {
            return product['category'] == selectedCategory;
          }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Center(child: Text('Home')),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favourite'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyContainer(),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Heading(text: 'Category'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = "All";
                        });
                      },
                      child: CategoriesOptions(
                        name: "All",
                        color: selectedCategory == "All"
                            ? Colors.white
                            : Colors.black,
                        bgcolor: selectedCategory == "All"
                            ? const Color(0xffAA14F0)
                            : Colors.grey[300],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = "Electronics";
                        });
                      },
                      child: CategoriesOptions(
                        name: "Electronics",
                        color: selectedCategory == "Electronics"
                            ? Colors.white
                            : Colors.black,
                        bgcolor: selectedCategory == "Electronics"
                            ? const Color(0xffAA14F0)
                            : Colors.grey[300],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = "Fashion";
                        });
                      },
                      child: CategoriesOptions(
                        name: "Fashion",
                        color: selectedCategory == "Fashion"
                            ? Colors.white
                            : Colors.black,
                        bgcolor: selectedCategory == "Fashion"
                            ? const Color(0xffAA14F0)
                            : Colors.grey[300],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = "Shoes";
                        });
                      },
                      child: CategoriesOptions(
                        name: "Shoes",
                        color: selectedCategory == "Shoes"
                            ? Colors.white
                            : Colors.black,
                        bgcolor: selectedCategory == "Shoes"
                            ? const Color(0xffAA14F0)
                            : Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Heading(text: 'Products'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
              ),
              // Products
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(filteredProducts.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              product: filteredProducts[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 180,
                        height: 320,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                addFavItems(filteredProducts[index]);
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: filteredProducts[index]['isFav'] == true
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                child: SizedBox(
                                  height: 140,
                                  width: double.infinity,
                                  child: Image.asset(
                                    '${filteredProducts[index]['productImage']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13, top: 5),
                              child: Text(
                                '${filteredProducts[index]['productName']}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber[700],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '1715 (review)',
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              child: Text(
                                ' Rs.${filteredProducts[index]['productPrice']}',
                                style: const TextStyle(
                                    color: Color(0xffAA14F0),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Heading(text: 'Popular Products'),
                    TextButton(onPressed: () {}, child: const Text('See All'))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300],
                          ),
                          child: Image.asset(products[3]['productImage']),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[3]['productName'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Text(
                                'Rs.${products[3]['productPrice']}',
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
