import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../provider/orders.dart';

class OrderItem extends StatefulWidget {
  final OrdersItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      child: Column(
        children: [
          ListTile(
            title: Text(
              '\RM ${widget.order.amount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 35),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy - hh:mm a').format(widget.order.dateTime),
              style: TextStyle(fontSize: 20),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 100, 180),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                prod.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${prod.quantity} X \RM ${prod.price.toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
