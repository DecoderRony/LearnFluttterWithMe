import 'package:flutter/material.dart';

import '../widgets/navigationDrawer.dart';

class FilterScreen extends StatefulWidget {
  final Function addFilters;
  FilterScreen(this.addFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  Widget _showSwitch(var title, bool switchValue, Function update) {
    return SwitchListTile(
        value: switchValue, title: Text(title), onChanged: update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: NavigationDrawer(),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: const Text(
                  'Filter Content Accordingly',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Divider(),
              Container(
                height: 250,
                child: ListView(
                  children: [
                    _showSwitch('Gluten Free', _isGlutenFree, (newvalue) {
                      setState(() {
                        _isGlutenFree = newvalue;
                      });
                    }),
                    _showSwitch('Lactose Free', _isLactoseFree, (newvalue) {
                      setState(() {
                        _isLactoseFree = newvalue;
                      });
                    }),
                    _showSwitch('Vegan', _isVegan, (newvalue) {
                      setState(() {
                        _isVegan = newvalue;
                      });
                    }),
                    _showSwitch('Vegetarian', _isVegetarian, (newvalue) {
                      setState(() {
                        _isVegetarian = newvalue;
                      });
                    }),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RaisedButton(
                      onPressed: () {
                        final filters = {
                          'gluten': _isGlutenFree,
                          'lactose': _isLactoseFree,
                          'vegan': _isVegan,
                          'vegetarian': _isVegetarian
                        };

                        widget.addFilters(filters);
                      },
                      child: Text('Filter Out'),
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
                ],
              )
            ],
          ),
        ));
  }
}
