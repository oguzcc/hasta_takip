import '../../core/config/api_options.dart';
import '../../core/config/flavor_config.dart';
import 'app/app.dart';
import 'app/bootstrap.dart';

void main() {
  FlavorConfig(
    name: 'dev',
    apiOptions: ApiOption.dev(),
  );
  bootstrap(() => const App());
}
