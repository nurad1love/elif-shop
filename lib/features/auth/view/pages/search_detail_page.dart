import 'package:elif_shop/features/auth/view/widgets/discount_label.dart';
import 'package:flutter/material.dart';

class SearchDetailPage extends StatefulWidget {
  const SearchDetailPage({Key? key}) : super(key: key);

  @override
  State<SearchDetailPage> createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
  late final Map<String, dynamic> singleItem;
  late List<Map<String, dynamic>> items;

  List<String> colors = ['Цвет', 'Серый', 'Белый', 'Желтый', 'Черный', 'Оранжевый'];
  List<String> sizes = ['Размер (KGZ)', '40', '42', '43', '44'];
  List<String> brands = ['Бренд', 'Adidas', 'Puma', 'Nike', 'Reebok', 'Salomon'];

  String selectedColor = 'Цвет';
  String selectedSize = 'Размер (KGZ)';
  String selectedBrand = 'Бренд';

  @override
  void initState() {
    super.initState();
    singleItem = {
      'name': 'Gucci',
      'price': '2100 с',
      'info': 'Спортивная обувь',
      'size': 'Размер: 39-41',
      'image': 'assets/images/gucci.png',
    };
    items = List.generate(4, (_) => singleItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color(0xffFFAB5D),
          title: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xffFFF7EF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Найти...',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.black),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Theme(
                  data: ThemeData(canvasColor: const Color(0xffFFF7EF)),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: selectedColor,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedColor = newValue!;
                      });
                    },
                    items: colors.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value == 'Цвет' ? 'Цвет' : value),
                      );
                    }).toList(),
                  ),
                ),
                Theme(
                  data: ThemeData(canvasColor: const Color(0xffFFF7EF)),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: selectedSize,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSize = newValue!;
                      });
                    },
                    items: sizes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value == 'Размер' ? 'Размер' : value),
                      );
                    }).toList(),
                  ),
                ),
                Theme(
                  data: ThemeData(canvasColor: const Color(0xffFFF7EF)),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: selectedBrand,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBrand = newValue!;
                      });
                    },
                    items: brands.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value == 'Бренд' ? 'Бренд' : value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.0),
              child: Text('Сортировать', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    items[index]['image'],
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 0,
                                child: DiscountLabel(discountPercentage: '      -44%      ',)
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  items[index]['info'],
                                  style: const TextStyle(
                                      fontSize: 12
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  items[index]['size'],
                                  style: const TextStyle(
                                    fontSize: 12
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  items[index]['price'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}