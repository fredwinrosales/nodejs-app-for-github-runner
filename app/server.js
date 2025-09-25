const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (_req, res) => {
  res.send('¡Hola desde Kaniko + Minikube + Docker Hub! 🚀');
});

app.listen(port, () => {
  console.log(`Servidor escuchando en http://0.0.0.0:${port}`);
});