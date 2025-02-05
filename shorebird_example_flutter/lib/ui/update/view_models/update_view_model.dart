import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/update/update_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@injectable
class UpdateViewModel {
  UpdateViewModel({
    required UpdateRepository updateRepository,
  }) : _updateRepository = updateRepository {
    download = Command0(_download);
  }
  final UpdateRepository _updateRepository;
  late final Command0<void> download;

  Future<Result<void>> _download() async {
    return _updateRepository.download();
  }
}
