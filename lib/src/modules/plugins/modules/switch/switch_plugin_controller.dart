import 'package:mobx/mobx.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;

import '../../../../app_bloc.dart';
import '../../../../shared/languages/en/strings.dart';
import '../../../../shared/models/plugin/plugin_model.dart';

part 'switch_plugin_controller.g.dart';

enum PluginState { LOADING, SUCCESS, FAIL, IDLE }

class SwitchPluginProvider = _SwitchPluginProvider with _$SwitchPluginProvider;

abstract class _SwitchPluginProvider with Store {
  final PluginModel _plugin;
  final AppProvider _appBloc;

  _SwitchPluginProvider(this._plugin, this._appBloc) {
    if (_appBloc.getMqttClient != null &&
        _appBloc.getMqttClient.connectionStatus != null) {
      _appBloc.getMqttClient
          .subscribe(_plugin.config['topicResult'], mqtt.MqttQos.exactlyOnce);
      final mqtt.MqttClientPayloadBuilder _builder =
          mqtt.MqttClientPayloadBuilder();
      _builder.addString('state');
      _publishMessage(_builder);
      _listenMessage();
    }
  }

  @observable
  bool _switchStatusController = false;

  @observable
  PluginState _stateController = PluginState.IDLE;

  @observable
  String message = '';

  bool get getSwitchStatus => _switchStatusController;

  PluginState get getState => _stateController;

  void _publishMessage(mqtt.MqttClientPayloadBuilder builder) {
    _appBloc.getMqttClient.publishMessage(
      _plugin.config['topic'],
      mqtt.MqttQos.values[0],
      builder.payload,
      retain: false,
    );
  }

  @action
  void _listenMessage() {
    _appBloc.getMqttMessages.listen((onData) {
      if (onData.message == _plugin.config['resultOn']) {
        _switchStatusController = true;
      } else {
        _switchStatusController = false;
      }
    });
  }

  @action
  Future<bool> switchPower() async {
    try {
      _stateController = PluginState.LOADING;
      final mqtt.MqttClientPayloadBuilder _builder =
          mqtt.MqttClientPayloadBuilder();

      if (_switchStatusController) {
        _builder.addString(_plugin.config['messageOff']);
      } else {
        _builder.addString(_plugin.config['messageOn']);
      }

      _publishMessage(_builder);

      _listenMessage();

      _stateController = PluginState.SUCCESS;
      return true;
    } catch (e) {
      message = Strings.switchErrorSendingMessage;
      print('switch_plugin_bloc:switchPower() $e');
      _stateController = PluginState.FAIL;
      return false;
    }
  }
}
