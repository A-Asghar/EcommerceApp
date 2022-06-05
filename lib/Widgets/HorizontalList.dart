import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
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
                                      'https://i.ytimg.com/vi/SdH13BXdNqI/mqdefault.jpg',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: Text(
                                  'Clothing',
                                  style: TextStyle(
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
