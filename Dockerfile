# ---- Etapa de build ----
FROM node:18-alpine AS builder
WORKDIR /app

# Solo copiar manifiestos para cachear npm ci
COPY app/package*.json ./
RUN npm ci --only=production

# Copiamos el código fuente (mínimo)
COPY app/. .

# ---- Etapa de runtime ----
FROM node:18-alpine
ENV NODE_ENV=production
WORKDIR /app

# Usuario no root
RUN addgroup -S nodegrp && adduser -S nodeusr -G nodegrp
USER nodeusr

# Copiamos desde builder solo lo necesario
COPY --from=builder /app /app

# Expón el puerto que usa la app
EXPOSE 3000

# Arranque
CMD ["node", "server.js"]