# Etapa 1 — Build
FROM node:20 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

RUN npx prisma generate --schema ./prisma/postgresql-schema.prisma
RUN npm run build

# Etapa 2 — Produção
FROM node:20
WORKDIR /app
COPY --from=builder /app ./
ENV NODE_ENV=production
EXPOSE 8080

# Executa o db push no início e depois inicia o app
CMD ["sh", "-c", "npx prisma db push --schema ./prisma/postgresql-schema.prisma --accept-data-loss && npm start"]
