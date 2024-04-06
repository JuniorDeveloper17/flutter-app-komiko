class DetailKomikModel {
  String? title;
  String? chapterBegin;
  String? chapterNow;
  String? image;
  String? ratting;
  String? titleAlternatif;
  String? status;
  String? pengarang;
  String? ilustrator;
  String? grafis;
  String? jenis;
  String? official;
  String? jumlahPembaca;
  String? synopsis;
  List<Informasi>? informasi;
  List<String>? genre;
  List<Chapters>? chapters;
  List<String>? spolier;
  List<Mirip>? mirip;

  DetailKomikModel(
      {this.title,
      this.chapterBegin,
      this.chapterNow,
      this.image,
      this.ratting,
      this.titleAlternatif,
      this.status,
      this.pengarang,
      this.ilustrator,
      this.grafis,
      this.jenis,
      this.official,
      this.jumlahPembaca,
      this.synopsis,
      this.informasi,
      this.genre,
      this.chapters,
      this.spolier,
      this.mirip});

  DetailKomikModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    chapterBegin = json['chapterBegin'];
    chapterNow = json['chapterNow'];
    image = json['image'];
    ratting = json['ratting'];
    titleAlternatif = json['titleAlternatif'];
    status = json['status'];
    pengarang = json['pengarang'];
    ilustrator = json['ilustrator'];
    grafis = json['grafis'];
    jenis = json['jenis'];
    official = json['official'];
    jumlahPembaca = json['jumlahPembaca'];
    synopsis = json['synopsis'];
    if (json['informasi'] != null) {
      informasi = <Informasi>[];
      json['informasi'].forEach((v) {
        informasi!.add(new Informasi.fromJson(v));
      });
    }
    genre = json['genre'].cast<String>();
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(new Chapters.fromJson(v));
      });
    }
    spolier = json['spolier'].cast<String>();
    if (json['mirip'] != null) {
      mirip = <Mirip>[];
      json['mirip'].forEach((v) {
        mirip!.add(new Mirip.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['chapterBegin'] = this.chapterBegin;
    data['chapterNow'] = this.chapterNow;
    data['image'] = this.image;
    data['ratting'] = this.ratting;
    data['titleAlternatif'] = this.titleAlternatif;
    data['status'] = this.status;
    data['pengarang'] = this.pengarang;
    data['ilustrator'] = this.ilustrator;
    data['grafis'] = this.grafis;
    data['jenis'] = this.jenis;
    data['official'] = this.official;
    data['jumlahPembaca'] = this.jumlahPembaca;
    data['synopsis'] = this.synopsis;
    if (this.informasi != null) {
      data['informasi'] = this.informasi!.map((v) => v.toJson()).toList();
    }
    data['genre'] = this.genre;
    if (this.chapters != null) {
      data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
    }
    data['spolier'] = this.spolier;
    if (this.mirip != null) {
      data['mirip'] = this.mirip!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Informasi {
  String? img;
  String? title;

  Informasi({this.img, this.title});

  Informasi.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['title'] = this.title;
    return data;
  }
}

class Chapters {
  String? url;
  String? chapter;

  Chapters({this.url, this.chapter});

  Chapters.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    chapter = json['chapter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['chapter'] = this.chapter;
    return data;
  }
}

class Mirip {
  String? image;
  String? type;
  String? genre;
  String? title;
  String? deskripsi;
  String? url;

  Mirip(
      {this.image,
      this.type,
      this.genre,
      this.title,
      this.deskripsi,
      this.url});

  Mirip.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    type = json['type'];
    genre = json['genre'];
    title = json['title'];
    deskripsi = json['deskripsi'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['type'] = this.type;
    data['genre'] = this.genre;
    data['title'] = this.title;
    data['deskripsi'] = this.deskripsi;
    data['url'] = this.url;
    return data;
  }
}
