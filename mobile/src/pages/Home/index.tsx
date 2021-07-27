import { ScrollView } from 'react-native';
import React, { useState, useEffect } from 'react';
import Card from '../../components/Card';
import { TouchableOpacity } from 'react-native';
import { StackScreenProps } from '@react-navigation/stack';
import api from '../../services/api';
import { Article } from '../../models/Article';

type StackParams = {
  Login: undefined;
  Home: undefined;
};

type Props = StackScreenProps<StackParams, 'Home'>;
const Home = ({ navigation }: Props) => {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    api
      .get('categories/24/articles?page=1&search=')
      .then(resp => resp.data)
      .then(setArticles);
  }, [articles]);

  const handleClick = (): void => {
    navigation.navigate('Article');
  };

  return (
    <ScrollView>
      <TouchableOpacity onPress={handleClick}>
        {articles.map((item: Article) => (
          <Card key={item.id} {...item} />
        ))}
      </TouchableOpacity>
    </ScrollView>
  );
};

export default Home;
