import 'package:flutter/material.dart';
import 'package:myapp/list.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({super.key});

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Faviourite'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.trolley),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: MediaQuery.sizeOf(context).aspectRatio * 1.2,
            ),
            itemCount: Faviourite.isEmpty ? 1 : Faviourite.length,
            itemBuilder: (context, index) {
              if (Faviourite.isEmpty) {
                return Container(
                  child: const Center(
                    child: Text('no Faviourite Items'),
                  ),
                );
              } else {
                return Container(
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
                            height: 120,
                            width: double.infinity,
                            child: Image.asset(
                              '${Faviourite[index]['productImage']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13, top: 5),
                        child: Text(
                          '${Faviourite[index]['productName']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
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
                          ' Rs.${Faviourite[index]['productPrice']}',
                          style: const TextStyle(
                              color: Color(0xffAA14F0),
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
