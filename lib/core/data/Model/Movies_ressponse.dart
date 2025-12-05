import 'package:movies_app/core/data/Model/Meta_data.dart';

import 'package:movies_app/core/data/Model/data.dart';

class Movies_ressponse {
  final String? status;
  final String? statusMessage;
  final Data? data;
  final Meta? meta;

  Movies_ressponse({this.status, this.statusMessage, this.data, this.meta});

  factory Movies_ressponse.fromJson(Map<String, dynamic> json) {
    return Movies_ressponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: json['data'] != null ? new Data.fromJson(json['data']) : null,
      meta: json['@meta'] != null ? new Meta.fromJson(json['@meta']) : null,
    );
  }
}

class Torrents {
  final String? url;
  final String? hash;
  final String? quality;
  final String? type;
  final String? isRepack;
  final String? videoCodec;
  final String? bitDepth;
  final String? audioChannels;
  final int? seeds;
  final int? peers;
  final String? size;
  final int? sizeBytes;
  final String? dateUploaded;
  final int? dateUploadedUnix;

  Torrents({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Torrents.fromJson(Map<String, dynamic> json) {
    return Torrents(
      url: json['url'],
      hash: json['hash'],
      quality: json['quality'],
      type: json['type'],
      isRepack: json['is_repack'],
      videoCodec: json['video_codec'],
      bitDepth: json['bit_depth'],
      audioChannels: json['audio_channels'],
      seeds: json['seeds'],
      peers: json['peers'],
      size: json['size'],
      sizeBytes: json['size_bytes'],
      dateUploaded: json['date_uploaded'],
      dateUploadedUnix: json['date_uploaded_unix'],
    );
  }
}
