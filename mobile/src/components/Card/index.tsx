import { Box, Text, Heading } from 'native-base';
import styles from './styles';
import React from 'react';
import { Article } from '../../models/Article';

const Card = (_props: Article) => {
  return (
    <Box style={styles.container}>
      <Box style={styles.boxImg} />
      <Box style={styles.boxInf}>
        <Heading style={styles.title}>Configuração</Heading>
        <Box>
          <Heading style={styles.subtitle} size="sm">
            Detalhes da configuração de um projeto React Native
          </Heading>
        </Box>
        <Text style={styles.author}>Autor: Phablo Vilas Boas</Text>
      </Box>
    </Box>
  );
};

export default Card;
