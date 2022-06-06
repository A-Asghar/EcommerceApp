import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<Categories> categoryList = [
    Categories(
        categoryName: 'Clothing',
        imageUrl:
            'https://i.ibb.co/dcX6q37/keagan-henman-Won79-9o-UEk-unsplash.jpg'),
    Categories(
        categoryName: 'Technology',
        imageUrl:
            'https://i.ibb.co/MNBgbrY/christopher-gower-m-HRf-Lhg-ABo-unsplash.jpg'),
    Categories(
        categoryName: 'Sports',
        imageUrl:
            'https://i.ibb.co/pK3mZ3s/victor-freitas-q-Z-U9z4-TQ6-A-unsplash.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 30),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(150), // Image radius
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      categoryList[index].imageUrl,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: Text(
                                  categoryList[index].categoryName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories {
  final String categoryName;
  final String imageUrl;

  Categories({required this.categoryName, required this.imageUrl});
}
