import 'package:flutter/material.dart';

class CardProdutoWidget extends StatelessWidget {
  final String nomeProduto;
  final String categoriaProduto;
  final String tipoProduto;
  final String valorProduto;

  const CardProdutoWidget(
      {Key key,
      @required this.nomeProduto,
      @required this.categoriaProduto,
      @required this.tipoProduto,
      @required this.valorProduto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            right: -90,
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
            ),
          ),
          Positioned(
            top: 50,
            right: -70,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 22, left: 15, right: 20, bottom: 15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nomeProduto,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  categoriaProduto,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      tipoProduto,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "R\$ ${double.parse(valorProduto).toStringAsFixed(2).replaceAll('.', ',')}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
