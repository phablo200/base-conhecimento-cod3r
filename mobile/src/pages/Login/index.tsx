import React from 'react';
import { FormControl, Stack, Input, Box, Text, Button } from 'native-base';
import { useState } from 'react';
import styles from './styles';
import { alertError } from '../../services/alert';
import Storage, { keyUser } from '../../services/storage';
import { StackScreenProps } from '@react-navigation/stack';
import { useEffect } from 'react';
import { StackParams } from '../../types';
import api, { setupApi } from '../../services/api';

type Props = StackScreenProps<StackParams, 'Login'>;
const Login = ({ navigation }: Props) => {
  const [email, setEmail] = useState('phablovilasboas25@gmail.com');
  const [password, setPassword] = useState('123456');
  const [loading, setLoading] = useState(true);

  const handleLogin = (value: string) => {
    setEmail(value);
  };
  const handlePassowrd = (value: string) => {
    setPassword(value);
  };

  useEffect(() => {
    Storage.getItem(keyUser).then(user => {
      if (user) {
        const { token } = JSON.parse(user);
        setupApi(token);
        navigation.navigate('Home');
      } else {
        setLoading(false);
      }
    });
  }, [navigation]);

  const handleClick = () => {
    const auth = {
      email,
      password,
    };
    api
      .post('signin', auth)
      .then(resp => resp.data)
      .then(async data => {
        setupApi(data.token);
        try {
          Storage.setItem(keyUser, data).then(() => {
            navigation.navigate('Home');
          });
        } catch (e) {
          alertError('Houve um erro ao tentar armazenar os dados do usuário, tente novamente.');
        }
      })
      .catch(() => {
        alertError('Login ou senha inválida');
      });
  };

  return (
    <>
      {loading && <Text>Carregando...</Text>}
      {!loading && (
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
              <Button style={styles.button} size="md" onPress={handleClick}>
                Entrar
              </Button>
            </Stack>
          </FormControl>
        </Box>
      )}
    </>
  );
};

export default Login;
