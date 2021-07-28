import { Box, Text, Heading } from 'native-base';
import styles from './styles';
import React from 'react';
import { Article } from '../../types';
import { Image } from 'react-native-svg';

const Card = (_props: Article) => {
  return (
    <Box style={styles.container}>
      <Box style={styles.boxImg}>
        <Image
          source={{ uri: 'https://www.contentviewspro.com/wp-content/uploads/2017/07/default_image.png' }}
          style={styles.img}
        />
      </Box>
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
