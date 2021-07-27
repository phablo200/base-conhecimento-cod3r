import React from 'react';
import {ScrollView, useWindowDimensions} from 'react-native';
import {Box, Heading} from 'native-base';
import styles from './styles';
import RenderHtml from 'react-native-render-html';

const Article = () => {
    const source = {
        html: '<h1>Hello World</h1>',
    };

    const {width} = useWindowDimensions();
    return (
        <ScrollView>
            <Box style={styles.container}>
                <Box style={styles.boxHeader}>
                    <Heading style={styles.title}>Configuração</Heading>
                    <Heading style={styles.subtitle}>
                        Testando subtitulo
                    </Heading>
                </Box>
                <Box style={styles.boxContent}>
                    <RenderHtml contentWidth={width} source={source} />
                </Box>
            </Box>
        </ScrollView>
    );
};

export default Article;
