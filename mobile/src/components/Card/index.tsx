import React from 'react';
import {Box, Text, Heading} from 'native-base';
import {TouchableOpacity} from 'react-native'; 
import styles from './styles';

const Card = () => {
    const handleClick = () => {
       //con 
    };

    return (
        <TouchableOpacity onPress={handleClick}>
            <Box style={styles.container}>
                <Box style={styles.boxImg}></Box>
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
        </TouchableOpacity>
    );
};

export default Card;
