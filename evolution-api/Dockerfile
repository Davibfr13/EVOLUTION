<<<<<<< HEAD
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

=======
# ------------------------------
# Dockerfile Evolution API - Render
# ------------------------------

FROM node:20-alpine

WORKDIR /app

# Desativa Husky e scripts de instalação
ENV HUSKY=0
ENV npm_config_ignore_scripts=true

# Copiar apenas package.json e package-lock.json (cache)
COPY package*.json ./

# Instalar dependências sem rodar scripts
RUN npm install --omit=dev

# Permitir scripts novamente para start/build
ENV npm_config_ignore_scripts=false

# Copiar todo o restante do projeto
COPY . .

# Gerar Prisma se o schema existir
RUN if [ -f prisma/schema.prisma ]; then \
        npx prisma generate --schema=prisma/schema.prisma; \
    elif [ -f src/prisma/schema.prisma ]; then \
        npx prisma generate --schema=src/prisma/schema.prisma; \
    elif [ -f src/database/prisma/schema.prisma ]; then \
        npx prisma generate --schema=src/database/prisma/schema.prisma; \
    else \
        echo "❌ schema.prisma não encontrado, pulando geração Prisma"; \
    fi

# Expor porta padrão
EXPOSE 8080

# Start da API
>>>>>>> cb2872c80205d75f0edb87f0c73be3f751f84b06
CMD ["npm", "start"]
