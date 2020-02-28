import 'dart:convert';

import 'package:store_hasura/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';

class UpdateTipoCategoriaProdutoDto {
  final List<TipoCategoriaDto> tipoProduto;
  final List<TipoCategoriaDto> categoriaProduto;
  final List<Produto> produto;

  UpdateTipoCategoriaProdutoDto({
    this.tipoProduto,
    this.categoriaProduto,
    this.produto,
  });

  UpdateTipoCategoriaProdutoDto copyWith({
    List<TipoCategoriaDto> tipoProduto,
    List<TipoCategoriaDto> categoriaProduto,
    List<Produto> produto,
  }) =>
      UpdateTipoCategoriaProdutoDto(
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        produto: produto ?? this.produto,
      );

  factory UpdateTipoCategoriaProdutoDto.fromJson(String str) =>
      UpdateTipoCategoriaProdutoDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateTipoCategoriaProdutoDto.fromMap(Map<String, dynamic> json) =>
      UpdateTipoCategoriaProdutoDto(
        tipoProduto: List<TipoCategoriaDto>.from(
            json["tipo_produto"].map((x) => TipoCategoriaDto.fromMap(x))),
        categoriaProduto: List<TipoCategoriaDto>.from(
            json["categoria_produto"].map((x) => TipoCategoriaDto.fromMap(x))),
        produto:
            List<Produto>.from(json["produto"].map((x) => Produto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
        "categoria_produto":
            List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
        "produto": List<dynamic>.from(produto.map((x) => x.toMap())),
      };
}

class Produto {
  final String id;
  final String nome;
  final String tipoProdutoId;
  final TipoCategoriaDto categoriaProduto;
  final TipoCategoriaDto tipoProduto;

  Produto({
    this.id,
    this.nome,
    this.tipoProdutoId,
    this.categoriaProduto,
    this.tipoProduto,
  });

  Produto copyWith({
    String id,
    String nome,
    String tipoProdutoId,
    TipoCategoriaDto categoriaProduto,
    TipoCategoriaDto tipoProduto,
  }) =>
      Produto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        tipoProdutoId: tipoProdutoId ?? this.tipoProdutoId,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        tipoProduto: tipoProduto ?? this.tipoProduto,
      );

  factory Produto.fromJson(String str) => Produto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
        id: json["id"],
        nome: json["nome"],
        tipoProdutoId: json["tipo_produto_id"],
        categoriaProduto: TipoCategoriaDto.fromMap(json["categoria_produto"]),
        tipoProduto: TipoCategoriaDto.fromMap(json["tipo_produto"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "tipo_produto_id": tipoProdutoId,
        "categoria_produto": categoriaProduto.toMap(),
        "tipo_produto": tipoProduto.toMap(),
      };
}
