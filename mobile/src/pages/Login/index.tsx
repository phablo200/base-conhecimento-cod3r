import React from 'react';
import {FormControl, Stack, Input, Box, Text} from 'native-base';
import {StyleSheet} from 'react-native';

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
});

const Login = () => {
    return (
        <Box style={styles.container}>
            <Box style={styles.boxText}>
                <Text>Faça seu login</Text>
            </Box>
            <FormControl isRequired isInvalid>
                <Stack>
                    <Input style={styles.input} placeholder="Login" />
                    <Input style={styles.input} placeholder="Senha" />
                </Stack>
            </FormControl>
        </Box>
    );
};

export default Login;
