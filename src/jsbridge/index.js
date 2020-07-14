import {NativeModules} from 'react-native';
import {objsToQuerys} from './utils';
const JSBridge = NativeModules.ReactJSBridge;

function call(moduleName, methodName, query = {}) {
  const bridge = `jsbridge://${moduleName}/${methodName}${
    Object.keys(query).length > 0 ? '?' : ''
  }${objsToQuerys(query)}`;
  JSBridge.call(bridge);
}

function callWithCallback(moduleName, methodName, query = {}, callback) {
  const bridge = `jsbridge://${moduleName}/${methodName}${
    Object.keys(query).length > 0 ? '?' : ''
  }${objsToQuerys(query)}`;
  JSBridge.callWithCallback(bridge, callback);
}

export {call, callWithCallback};
