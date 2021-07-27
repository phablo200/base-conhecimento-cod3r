import { StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  container: {
    display: 'flex',
    flexDirection: 'row',
    width: '100%',
    padding: '2%',
    borderBottomWidth: 0.3,
    marginTop: '1%',
  },
  boxImg: {
    flexBasis: '30%',
    borderRightWidth: 0.2,
  },
  boxInf: {
    display: 'flex',
    marginLeft: '3%',
  },
  title: {
    fontSize: 20,
  },
  subtitle: {
    fontSize: 13,
    textAlign: 'justify',
    width: '80%',
  },
  author: {
    marginTop: '5%',
    fontSize: 11,
    fontWeight: 'bold',
  },
});

export default styles;
