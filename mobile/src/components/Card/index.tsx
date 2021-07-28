import { Box, Text, Heading } from 'native-base';
import styles from './styles';
import React from 'react';
import { Article } from '../../models/Article';

const Card = (_props: Article) => {
  return (
    <Box style={styles.container}>
      <Box style={styles.boxImg} />
      <Box style={styles.boxInf}>
        <Heading style={styles.title}>{_props.name}</Heading>
        <Box>
          <Heading style={styles.subtitle} size="sm">
            {_props.description}
          </Heading>
        </Box>
        <Text style={styles.author}>{_props.author}</Text>
      </Box>
    </Box>
  );
};

export default Card;
