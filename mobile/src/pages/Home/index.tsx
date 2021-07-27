import {ScrollView} from 'react-native';
import React from 'react';
import Card from '../../components/Card';
import {TouchableOpacity} from 'react-native';
import {StackScreenProps} from '@react-navigation/stack';

type StackParams = {
    Login: undefined;
    Home: undefined;
};

type Props = StackScreenProps<StackParams, 'Home'>;

const Home = ({navigation}: Props) => {
    const handleClick = () => {
        navigation.navigate('Article');
    };

    return (
        <ScrollView>
            <TouchableOpacity onPress={handleClick}>
                <Card />
            </TouchableOpacity>
        </ScrollView>
    );
};

export default Home;
