import 'package:flutter/material.dart';
import 'package:flutter_app/src/ShoppingListItem.dart';
import 'package:flutter_app/src/TapboxA.dart';
import 'package:flutter_app/src/Product.dart';

class ShoppingList extends StatefulWidget {
    ShoppingList({Key key, this.products}) : super(key: key);

    final List<Product> products;

    // The framework calls createState the first time a widget appears at a given
    // location in the tree. If the parent rebuilds and uses the same type of
    // widget (with the same key), the framework re-uses the State object
    // instead of creating a new State object.

    @override
    _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
    Set<Product> _shoppingCart = Set<Product>();

    void _handleCartChanged(Product product, bool inCart) {
        setState(() {
            // When a user changes what's in the cart, we need to change _shoppingCart
            // inside a setState call to trigger a rebuild. The framework then calls
            // build, below, which updates the visual appearance of the app.

            if (inCart)
                _shoppingCart.add(product);
            else
                _shoppingCart.remove(product);
        });
    }

    void _pushSaved() {
        Navigator.of(context).push(
            new MaterialPageRoute<void>(
                builder: (BuildContext context) {
                    return TapboxA();
                },
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Shopping List'),
                actions: <Widget>[
                    new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
                ],
            ),
            body: ListView(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                children: widget.products.map((Product product) {
                    return ShoppingListItem(
                        product1: product,
                        inCart: _shoppingCart.contains(product),
                        onCartChanged: _handleCartChanged,
                    );
                }).toList(),
            ),
        );
    }
}