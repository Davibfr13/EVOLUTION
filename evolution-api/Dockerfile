# Etapa 1 — Build da aplicação
FROM node:20 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run db:generate
RUN npm run build

# Etapa 2 — Imagem final
FROM node:20
WORKDIR /app

COPY --from=builder /app ./
ENV NODE_ENV=production
EXPOSE 8080

# Garante que o Prisma Client está disponível
RUN npx prisma generate --schema ./prisma/DATABASE_PROVIDER-schema.prisma

CMD ["npm", "start"]
