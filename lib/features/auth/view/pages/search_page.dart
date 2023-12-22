import 'package:elif_shop/features/auth/view/pages/search_detail_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> shoeNames = ['Обувь', 'Обувь'];
  late int _selectedOptionIndex;

  @override
  void initState() {
    super.initState();
    _selectedOptionIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
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
                        onChanged: (value) {
                        },
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedOptionIndex = 0;
                  });
                },
                child: Text(
                  'Мужской',
                  style: TextStyle(
                    fontWeight: _selectedOptionIndex == 0
                        ? FontWeight.bold
                        : FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedOptionIndex = 1;
                  });
                },
                child: Text(
                  'Женский',
                  style: TextStyle(
                    fontWeight: _selectedOptionIndex == 1
                        ? FontWeight.bold
                        : FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: _selectedOptionIndex == 0
                      ? Colors.black
                      : Colors.transparent,
                ),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  color: _selectedOptionIndex == 1
                      ? Colors.black
                      : Colors.transparent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: shoeNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchDetailPage(),));
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFF7EF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                shoeNames[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/puma1.png',
                          width: 140,
                          height: 120,
                          fit: BoxFit.cover,
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
    );
  }
}