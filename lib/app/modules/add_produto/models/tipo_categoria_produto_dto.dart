import 'dart:convert';

class TipoCategoriaProdutoDto {
  final List<TipoCategoriaDto> tipoProduto;
  final List<TipoCategoriaDto> categoriaProduto;

  TipoCategoriaProdutoDto({
    this.tipoProduto,
    this.categoriaProduto,
    String descricao,
    String id,
  });

  TipoCategoriaProdutoDto copyWith({
    List<TipoCategoriaDto> tipoProduto,
    List<TipoCategoriaDto> categoriaProduto,
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
            : List<TipoCategoriaDto>.from(
                json["tipo_produto"].map((x) => TipoCategoriaDto.fromMap(x))),
        categoriaProduto: json["categoria_produto"] == null
            ? null
            : List<TipoCategoriaDto>.from(json["categoria_produto"]
                .map((x) => TipoCategoriaDto.fromMap(x))),
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

class TipoCategoriaDto {
  final String id;
  final String descricao;

  TipoCategoriaDto({
    this.id,
    this.descricao,
  });

  TipoCategoriaDto copyWith({
    String id,
    String descricao,
  }) =>
      TipoCategoriaDto(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
      );

  factory TipoCategoriaDto.fromJson(String str) =>
      TipoCategoriaDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoCategoriaDto.fromMap(Map<String, dynamic> json) =>
      TipoCategoriaDto(
        id: json["id"] == null ? null : json["id"],
        descricao: json["descricao"] == null ? null : json["descricao"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "descricao": descricao == null ? null : descricao,
      };
}
