import {Alert} from 'react-native';

export const alertError = (
    msg: string,
    success: () => void,
    error?: () => void,
): void => {
    Alert.alert('Atenção', msg, [
        {
            text: 'Cancel',
            onPress: () => success(),
            style: 'cancel',
        },
        {
            text: 'OK',
            onPress: () => error && error(),
        },
    ]);
};

export const alertSuccess = () => {
    console.log('alertSuccess');
};
