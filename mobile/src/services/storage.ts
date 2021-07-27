import AsyncStorage from '@react-native-async-storage/async-storage';

export const keyUser = '_knowledge_user';

const setItem = async (key: string, data: string) => {
  try {
    await AsyncStorage.setItem(key, JSON.stringify(data));
  } catch (e) {
    throw new Error(e);
  }
};

const getItem = async (key: string) => {
  try {
    const item = await AsyncStorage.getItem(key);
    return item;
  } catch (e) {
    throw new Error(e);
  }
};

export default {
  setItem,
  getItem,
};
