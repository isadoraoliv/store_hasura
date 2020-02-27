import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class CustomComboboxWidget extends StatelessWidget {
  final List<Model> items;
  final Function(Model) onChanged;
  final Model itemSelecionado;

  const CustomComboboxWidget(
      {Key key,
      @required this.items,
      @required this.onChanged,
      @required this.itemSelecionado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FindDropdown<Model>(
      items: items,
      onChanged: (Model item) => onChanged(item),
      selectedItem: itemSelecionado,
      validate: (Model item) {
        if (item == null)
          return "Você precisa selecionar um valor!";
        else
          return null;
      },
      dropdownBuilder: (_, model) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: model?.id == null
              ? ListTile(
                  title: Text(
                    "Selecione um item",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : ListTile(
                  title: Text(
                    model.descricao,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class Model {
  final String id;
  final String descricao;

  Model(this.id, this.descricao);

  @override
  String toString() => descricao.toString();

  ///equals - comparar dois objetos
  @override
  operator ==(o) => o is Model && o.id == id;

  ///diferenciar um valor do outro
  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;
}
