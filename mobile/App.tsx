/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/react-native-community/react-native-template-typescript
 *
 * @format
 */

import React from 'react';
import { NativeBaseProvider } from 'native-base';
import Login from './src/pages/Login';
import Home from './src/pages/Home';
import Article from './src/pages/Article';
import 'react-native-gesture-handler';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

type StackParams = {
  Login: undefined;
  Home: undefined;
  Article: undefined;
};

const MainStack = createStackNavigator<StackParams>();

const App = () => {
  return (
    <NativeBaseProvider>
      <NavigationContainer>
        <MainStack.Navigator initialRouteName="Login">
          <MainStack.Screen name="Login" component={Login} />
          <MainStack.Screen name="Home" component={Home} />
          <MainStack.Screen name="Article" component={Article} />
        </MainStack.Navigator>
      </NavigationContainer>
    </NativeBaseProvider>
  );
};

export default App;
