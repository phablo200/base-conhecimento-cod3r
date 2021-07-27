import axios from 'axios';

const api = axios.create({
  baseURL: 'http://192.168.1.108:3005',
});

api.defaults.headers.common.Authorization =
  'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwibmFtZSI6IlBoYWJsbyBWaWxhcyBCb2FzIFNlbmEiLCJlbWFpbCI6InBoYWJsb3ZpbGFzYm9hczI1QGdtYWlsLmNvbSIsImFkbWluIjp0cnVlLCJpYXQiOjE2MjczMTU5MzIsImV4cCI6MTYyNzU3NTEzMn0.Vgp0giuWo1wm4qq-Sl37I7-5r7FnPHwtZS5hFqfMq50';

export default api;
