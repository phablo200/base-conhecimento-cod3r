import axios from 'axios';

const api = axios.create({
  baseURL: 'http://192.168.1.108:3005',
});

export const apiInit = (token: string): void => {
  console.log('token', token);
  //api.defaults.headers.common.Authorization = `bearer ${token}`;
};

export default api;
