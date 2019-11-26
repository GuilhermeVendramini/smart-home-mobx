// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_plugin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SwitchPluginProvider on _SwitchPluginProvider, Store {
  final _$_switchStatusControllerAtom =
      Atom(name: '_SwitchPluginProvider._switchStatusController');

  @override
  bool get _switchStatusController {
    _$_switchStatusControllerAtom.context
        .enforceReadPolicy(_$_switchStatusControllerAtom);
    _$_switchStatusControllerAtom.reportObserved();
    return super._switchStatusController;
  }

  @override
  set _switchStatusController(bool value) {
    _$_switchStatusControllerAtom.context.conditionallyRunInAction(() {
      super._switchStatusController = value;
      _$_switchStatusControllerAtom.reportChanged();
    }, _$_switchStatusControllerAtom,
        name: '${_$_switchStatusControllerAtom.name}_set');
  }

  final _$_stateControllerAtom =
      Atom(name: '_SwitchPluginProvider._stateController');

  @override
  PluginState get _stateController {
    _$_stateControllerAtom.context.enforceReadPolicy(_$_stateControllerAtom);
    _$_stateControllerAtom.reportObserved();
    return super._stateController;
  }

  @override
  set _stateController(PluginState value) {
    _$_stateControllerAtom.context.conditionallyRunInAction(() {
      super._stateController = value;
      _$_stateControllerAtom.reportChanged();
    }, _$_stateControllerAtom, name: '${_$_stateControllerAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_SwitchPluginProvider.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }

  final _$switchPowerAsyncAction = AsyncAction('switchPower');

  @override
  Future<bool> switchPower() {
    return _$switchPowerAsyncAction.run(() => super.switchPower());
  }

  final _$_SwitchPluginProviderActionController =
      ActionController(name: '_SwitchPluginProvider');

  @override
  void _listenMessage() {
    final _$actionInfo = _$_SwitchPluginProviderActionController.startAction();
    try {
      return super._listenMessage();
    } finally {
      _$_SwitchPluginProviderActionController.endAction(_$actionInfo);
    }
  }
}
