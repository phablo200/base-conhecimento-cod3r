import {Alert} from 'react-native';

export const alertError = (msg: string, cb?: () => void): void => {
    Alert.alert('Atenção', msg, [
        {
            text: 'OK',
            onPress: () => cb && cb(),
        },
    ]);
};

export const alertSuccess = () => {
    console.log('alertSuccess');
};
