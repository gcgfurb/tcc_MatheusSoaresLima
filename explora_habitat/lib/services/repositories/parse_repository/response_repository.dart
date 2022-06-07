import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:explora_habitat/services/enum/field_type.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/models/response_activity.dart';
import 'package:explora_habitat/services/repositories/parse_repository/parse_errors.dart';
import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:explora_habitat/services/repositories/parse_repository/user_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ResponseRepository {
  Future<void> save(
      ResponseActivity responseActivity, String activityId) async {
    final parseUser = await ParseUser.currentUser() as ParseUser;

    print(responseActivity.images);
    final parseImages = await _saveFiles(responseActivity.images);
    final parseVideos = await _saveFiles(responseActivity.videos);
    final parseAudios = await _saveFiles(responseActivity.audios);
    final parseDrawings = await _saveFiles(responseActivity.drawings);

    final responseObject = ParseObject(keyResponseTable);

    final parseAcl = ParseACL(owner: parseUser);
    parseAcl.setPublicReadAccess(allowed: true);
    parseAcl.setPublicWriteAccess(allowed: false);
    responseObject.setACL(parseAcl);

    if (responseActivity.id != null) {
      responseObject.objectId = responseActivity.id;
    }

    responseObject.set<List<CustomField>>(
        keyResponseCustomFields, responseActivity.customFields);
    responseObject.set<double>(
        keyResponseLatitude, responseActivity.latitude ?? 0);
    responseObject.set<double>(
        keyResponseLongitude, responseActivity.longitude ?? 0);
    responseObject.set<ParseUser>(keyResponseUser, parseUser);
    responseObject.set<List<ParseFile>>(keyResponseImages, parseImages);
    responseObject.set<List<ParseFile>>(keyResponseVideos, parseVideos);
    responseObject.set<List<ParseFile>>(keyResponseAudios, parseAudios);
    responseObject.set<List<ParseFile>>(keyResponseDrawings, parseDrawings);
    responseObject.set(keyResponseActivity,
        (ParseObject(keyActivityTable)..objectId = activityId).toPointer());

    var response = await responseObject.save();
    if (response.success) {
      responseActivity.id = response.result.objectId;
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<List<ParseFile>> _saveFiles(List files) async {
    final parseFiles = <ParseFile>[];

    try {
      for (final filePath in files) {
        File file = File(filePath);
        final ParseFile parseFile =
            ParseFile(file, name: path.basename(file.path));
        final response = await parseFile.save();
        if (!response.success) {
          return Future.error(
            ParseErrors.getDescription(response.error!.code),
          );
        }
        parseFiles.add(parseFile);
      }
    } catch (e) {
      Future.error('Falha ao salvar imagens');
    }
    return parseFiles;
  }

  Future<List<ResponseActivity>> findAllByActivity(
      ParseObject activityObject) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyResponseTable))
          ..whereEqualTo('activity', activityObject.toPointer());

    ParseResponse response = await queryBuilder.query();

    print(activityObject.objectId == "6eedkNBLIo");
    if (response.success) {
      List<ResponseActivity> responses = [];
      if (response.results != null) {
        for (ParseObject parseObject in response.results!) {
          var response = mapParseToResponseActivity(parseObject);
          ParseUser user = parseObject.get<ParseUser>(keyResponseUser)!;
          response.user = await UserRepository().findById(user.objectId!);

          var parseImages =
              parseObject.get<List<dynamic>>(keyResponseImages) ?? [];
          for (dynamic parseImage in parseImages) {
            var file = await getFiles(parseImage['url'], parseImage['name']);
            response.images.add(file.path);
          }

          var parseVideos =
              parseObject.get<List<dynamic>>(keyResponseVideos) ?? [];
          for (dynamic parseVideo in parseVideos) {
            var file = await getFiles(parseVideo['url'], parseVideo['name']);
            response.videos.add(file.path);
          }

          responses.add(response);
        }
      }
      return responses;
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  ResponseActivity mapParseToResponseActivity(ParseObject parseObject) {
    ResponseActivity response = ResponseActivity();
    response.id = parseObject.objectId!;
    response.customFields = _convertCustomField(
        parseObject.get<List<dynamic>>(keyResponseCustomFields));
    response.longitude = parseObject.get<double>(keyResponseLongitude);
    response.latitude = parseObject.get<double>(keyResponseLatitude);

    return response;
  }

  Future<File> getFiles(String url, String imageName) async {
    var response = await http.get(Uri.parse(url));
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    File file = File("${documentDirectory.path}/images/$imageName");
    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }

  List<CustomField> _convertCustomField(List<dynamic>? fields) {
    if (fields == null) {
      return [];
    }

    return List.from(fields.map(
      (field) => CustomField(
        title: field['title'],
        type: FieldType.values
            .firstWhere((element) => element.value == field['type']),
        value: field['value'],
        required: field['required'],
      ),
    ));
  }
}
