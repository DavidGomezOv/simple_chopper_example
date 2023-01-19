// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_datasource.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$HomeDatasource extends HomeDatasource {
  _$HomeDatasource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HomeDatasource;

  @override
  Future<Response<List<ItemListModel>>> getItemList() {
    final Uri $url = Uri.parse('/item_list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ItemListModel>, ItemListModel>($request);
  }
}
