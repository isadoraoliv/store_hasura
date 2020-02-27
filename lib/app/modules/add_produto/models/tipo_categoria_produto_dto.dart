import 'dart:convert';

class TipoCategoriaProdutoDto {
  final List<Produto> tipoProduto;
  final List<Produto> categoriaProduto;

  TipoCategoriaProdutoDto({
    this.tipoProduto,
    this.categoriaProduto,
  });

  TipoCategoriaProdutoDto copyWith({
    List<Produto> tipoProduto,
    List<Produto> categoriaProduto,
  }) =>
      TipoCategoriaProdutoDto(
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
      );

  factory TipoCategoriaProdutoDto.fromJson(String str) =>
      TipoCategoriaProdutoDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoCategoriaProdutoDto.fromMap(Map<String, dynamic> json) =>
      TipoCategoriaProdutoDto(
        tipoProduto: json["tipo_produto"] == null
            ? null
            : List<Produto>.from(
                json["tipo_produto"].map((x) => Produto.fromMap(x))),
        categoriaProduto: json["categoria_produto"] == null
            ? null
            : List<Produto>.from(
                json["categoria_produto"].map((x) => Produto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tipo_produto": tipoProduto == null
            ? null
            : List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
        "categoria_produto": categoriaProduto == null
            ? null
            : List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
      };

  ///app.quicktype nao gera automatico
  static List<TipoCategoriaProdutoDto> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<TipoCategoriaProdutoDto>(
            (item) => TipoCategoriaProdutoDto.fromMap(item))
        .toList();
  }
}

class Produto {
  final String id;
  final String descricao;

  Produto({
    this.id,
    this.descricao,
  });

  Produto copyWith({
    String id,
    String descricao,
  }) =>
      Produto(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
      );

  factory Produto.fromJson(String str) => Produto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
        id: json["id"] == null ? null : json["id"],
        descricao: json["descricao"] == null ? null : json["descricao"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "descricao": descricao == null ? null : descricao,
      };
}
