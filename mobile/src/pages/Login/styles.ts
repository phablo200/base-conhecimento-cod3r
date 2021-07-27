import { StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  container: {
    height: '100%',
    display: 'flex',
    justifyContent: 'center',
    paddingLeft: '5%',
    paddingRight: '5%',
  },
  boxText: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'center',
  },
  text: {
    fontSize: 25,
  },
  formControl: {
    marginTop: '5%',
  },
  input: {
    marginTop: '2%',
  },
  button: {
    marginTop: '5%',
    borderRadius: 40,
    height: 60,
  },
  image: {
    flex: 1,
    justifyContent: 'center',
  },
});

export default styles;
