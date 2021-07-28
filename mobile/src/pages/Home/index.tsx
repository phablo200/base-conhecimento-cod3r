import { ScrollView } from 'react-native';
import React, { useState, useEffect } from 'react';
import Card from '../../components/Card';
import { TouchableOpacity } from 'react-native';
import { StackScreenProps } from '@react-navigation/stack';
import api from '../../services/api';
import { StackParams, Article } from '../../types';

type Props = StackScreenProps<StackParams, 'Home'>;
const Home = ({ navigation }: Props) => {
  const [articles, setArticles] = useState([]);

  const getArticles = (isCancelled: boolean) => {
    api
      .get('categories/24/articles?page=1&search=')
      .then(resp => resp.data.articles)
      .then(articles => {
        if (!isCancelled) {
          setArticles(articles);
        }
      })
      .catch(console.log);
  };

  useEffect(() => {
    let isCancelled = false;
    getArticles(isCancelled);
    return () => {
      isCancelled = true;
    };
  }, [articles]);

  const handleClick = (id: number): void => {
    navigation.navigate('Article', { id });
  };

  const renderArticles = () => {
    if (articles.length) {
      return articles.map((article: Article) => (
        <TouchableOpacity key={article.id} onPress={() => handleClick(article.id)}>
          <Card {...article} />
        </TouchableOpacity>
      ));
    }
    return false;
  };

  return <ScrollView>{renderArticles()}</ScrollView>;
};

export default Home;
