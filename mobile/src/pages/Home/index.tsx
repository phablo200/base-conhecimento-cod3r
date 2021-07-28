import { ScrollView, Text } from 'react-native';
import React, { useState, useEffect } from 'react';
import Card from '../../components/Card';
import { TouchableOpacity } from 'react-native';
import { StackScreenProps } from '@react-navigation/stack';
import api from '../../services/api';
import { Article } from '../../models/Article';

type StackParams = {
  Login: undefined;
  Home: undefined;
  Article: undefined;
};

type Props = StackScreenProps<StackParams, 'Home'>;
const Home = ({ navigation }: Props) => {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    api
      .get('categories/24/articles?page=1&search=')
      .then(resp => resp.data.articles)
      .then(setArticles)
      .catch(console.log);
  }, [articles]);

  const handleClick = (id: number): void => {
    console.log('id', id);
    navigation.navigate('Article');
  };

  const renderArticles = () => {
    if (articles.length) {
      return articles.map((article: Article) => (
        <TouchableOpacity key={article.id} onPress={() => handleClick(article.id)}>
          <Card {...article}></Card>
        </TouchableOpacity>
      ));
    }

    return false;
  };

  return <ScrollView>{renderArticles()}</ScrollView>;
};

export default Home;
