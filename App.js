import React, {Component} from 'react';
import {View, StyleSheet, Button, Text} from 'react-native';
import {call, callWithCallback} from './src/jsbridge';
export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      msg: '',
    };
  }
  showAlert = () => {
    call('app', 'showToast', {
      title: '我是标题',
      msg: '我是内容',
    });
  };
  getNetWork = () => {
    callWithCallback('app', 'getAppInfo', {}, (data) => {
      this.setState({
        msg: JSON.stringify(data),
      });
    });
  };
  render() {
    const {msg} = this.state;
    return (
      <View style={stypes.body}>
        <Text>JSBridge</Text>
        <Button onPress={this.showAlert} title="一个弹窗(无返回值)" />
        <Button onPress={this.getNetWork} title="app信息(有返回值)" />
        <Text>{msg}</Text>
      </View>
    );
  }
}

const stypes = StyleSheet.create({
  body: {
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
    height: '100%',
  },
});
