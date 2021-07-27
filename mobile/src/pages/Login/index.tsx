import React from 'react';
import {FormControl, Stack, Input, Box, Text, Button} from 'native-base';
import {useState} from 'react';
import styles from './styles';
import axios from 'axios';
import {Alert} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import {key} from '../../config/storage';
import {alertError} from '../../services/alert';

const Login = () => {
    const [email, setEmail] = useState('phablovilasboas25@gmail.com');
    const [password, setPassword] = useState('123456');
    const handleLogin = (value: string) => {
        setEmail(value);
    };
    const handlePassowrd = (value: string) => {
        setPassword(value);
    };
    const handleClick = () => {
        const auth = {
            email,
            password,
        };
        axios
            .post('http://192.168.1.108:3005/signin', auth)
            .then(resp => resp.data)
            .then(async data => {
                try {
                    await AsyncStorage.setItem(key, JSON.stringify(data));
                    // Navegar para a tela inicial.
                    alertError(() => {
                        console.log('to aqui');
                    });
                } catch (e) {
                    Alert.alert(
                        'Atenção',
                        'Houve um erro ao salvar os dados iniciais do aplicativo, reiniciei o aplicativo e tente novamente.',
                        [
                            {
                                text: 'Cancel',
                                onPress: () => console.log('Cancel Pressed'),
                                style: 'cancel',
                            },
                            {
                                text: 'OK',
                                onPress: () => console.log('OK Pressed'),
                            },
                        ],
                    );
                }
            })
            .catch(() => {
                Alert.alert('Atenção', 'Login ou senha inválida', [
                    {
                        text: 'Cancel',
                        onPress: () => console.log('Cancel Pressed'),
                        style: 'cancel',
                    },
                    {
                        text: 'OK',
                        onPress: () => console.log('OK Pressed'),
                    },
                ]);
            });
    };
    return (
        <Box style={styles.container}>
            <Box style={styles.boxText}>
                <Text style={styles.text}>Faça seu login</Text>
            </Box>

            <FormControl isRequired style={styles.formControl}>
                <Stack>
                    <Input
                        type="text"
                        value={email}
                        style={styles.input}
                        placeholder="Login"
                        onChange={e => handleLogin(e.target.value)}
                    />
                    <Input
                        type="password"
                        value={password}
                        style={styles.input}
                        placeholder="Senha"
                        onChange={e => handlePassowrd(e.target.value)}
                    />
                    <Button
                        style={styles.button}
                        size="md"
                        onPress={handleClick}>
                        Entrar
                    </Button>
                </Stack>
            </FormControl>
        </Box>
    );
};

export default Login;
