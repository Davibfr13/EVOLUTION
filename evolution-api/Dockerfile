# Etapa 1 — Build
FROM node:20 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# Gera Prisma Client e builda o app
RUN npx prisma generate --schema ./prisma/postgresql-schema.prisma
RUN npm run build

# Etapa 2 — Produção
FROM node:20
WORKDIR /app
COPY --from=builder /app ./
ENV NODE_ENV=production
EXPOSE 8080

CMD ["npm", "start"]
