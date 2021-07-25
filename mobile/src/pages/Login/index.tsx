import React from 'react';
import {FormControl, Stack, Input, Box, Text, Button} from 'native-base';
import {StyleSheet} from 'react-native';
import { useState } from 'react';

const styles = StyleSheet.create({
    container: {
        height: '100%',
        display: 'flex',
        justifyContent: 'center',
        paddingLeft: '5%',
        paddingRight: '5%',
    },
    boxText: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'center',
    },
    input: {
        marginTop: '2%',
    },
    button: {
        marginTop: '2%',
    },
});

const Login = () => {
    const [login, setLogin] = useState('phablovilasboas25@gmail.com');
    const [password, setPassword] = useState('12345');
    const handleLogin = (value: string) => {
        setLogin(value);
    };
    const handlePassowrd = (value: string) => {
        setPassword(value);
    };

    const handleClick = () => {
        alert('Entrar');
    };

    return (
        <Box style={styles.container}>
            <Box style={styles.boxText}>
                <Text>Faça seu login</Text>
            </Box>
            <FormControl isRequired>
                <Stack>
                    <Input
                        type="text"
                        value={login}
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
