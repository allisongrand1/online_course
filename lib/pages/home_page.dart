import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  bool _isLoading = false;
  final List<Map<String, Object>> _chips = [
    {'name': 'News', 'isSelect': false},
    {'name': 'Book', 'isSelect': true},
    {'name': 'Games', 'isSelect': true},
    {'name': 'Messages', 'isSelect': false},
    {'name': 'People', 'isSelect': false},
    {'name': 'City', 'isSelect': false},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme app'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_alt),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentIndex) {
          _tabController.index = currentIndex;
          setState(() {
            _currentTabIndex = currentIndex;
            _tabController.animateTo(_currentTabIndex);
          });
        },
        currentIndex: _currentTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Список товаров',
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Поиск товаров',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Заказать товар'),
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() => _isLoading = false);
                      },
                    ),
                  ],
                ),
              ),
              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(),
                ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    8,
                    (index) => Card(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/img_${index + 1}.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Краткое описание карточки'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
          GridView.builder(
              itemCount: _chips.length,
              itemBuilder: (BuildContext context, item) {
                return FilterChip(
                  onSelected: (_chips.length - item) > 1
                      ? (v) {
                          setState(() {
                            _chips[item]['isSelect'] = v;
                          });
                        }
                      : null,
                  selected: _chips[item]['isSelect'] == true ? true : false,
                  label: Text("${_chips[item]['name']}"),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  mainAxisExtent: 50)),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            ElevatedButton(
                              child: const Text('Да'),
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              child: const Text('Нет'),
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                          title: const Text('Сменить аватар'),
                        );
                      },
                    );
                  },
                  child: const CircleAvatar(
                    radius: 40,
                    child: Text('AB'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
