import 'package:flutter/material.dart';
import 'package:noti/data/datasources/local_database.dart';
import 'package:noti/data/repository/repository_impl.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> providers = <SingleChildWidget>[
        Provider<LocalDatabase>(
          create: (BuildContext context) => LocalDatabase(),
        ),
        Provider<Repository>(
          create: (BuildContext context) => RepositoryImpl(
            localDatabase: context.read<LocalDatabase>(),
          ),
        ),
      ];
}
