import React, { useState } from 'react';
import { ScrollView, useWindowDimensions } from 'react-native';
import { Box, Heading } from 'native-base';
import styles from './styles';
import RenderHtml from 'react-native-render-html';
import { useEffect } from 'react';
import { StackScreenProps } from '@react-navigation/stack';
import api from '../../services/api';
import { Article as TypeArticle, StackParams } from '../../types';

type Props = StackScreenProps<StackParams, 'Article'>;
const Article = ({ route }: Props) => {
  const [article, setArticle] = useState<TypeArticle>({
    id: 0,
    author: '',
    description: '',
    imageUrl: '',
    name: '',
    content: '',
  });
  const { width } = useWindowDimensions();

  useEffect(() => {
    const id = route.params.id;
    api
      .get(`articles/${id}`)
      .then(resp => resp.data)
      .then(setArticle);
  }, [route]);

  return (
    <ScrollView>
      <Box style={styles.container}>
        <Box style={styles.boxHeader}>
          <Heading style={styles.title}>{article.name}</Heading>
          <Heading style={styles.subtitle}>{article.description}</Heading>
        </Box>
        <Box style={styles.boxContent}>
          <RenderHtml
            contentWidth={width}
            source={{
              html: article.content,
            }}
          />
        </Box>
      </Box>
    </ScrollView>
  );
};

export default Article;
