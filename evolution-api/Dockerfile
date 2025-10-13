# Usa Node 20 (requisito mínimo)
FROM node:20-bullseye

WORKDIR /app

# Copiar arquivos de dependência primeiro
COPY package*.json ./

# Instalar ferramentas necessárias
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

# Instalar dependências sem rodar husky
RUN npm install --ignore-scripts

# Copiar o restante do projeto
COPY . .

# ⚙️ Gerar cliente Prisma (com caminho explícito)
RUN npx prisma generate --schema=src/api/repository/prisma/schema.prisma

# Expor a porta padrão da Evolution API
EXPOSE 8080

# Iniciar a API
CMD ["npm", "start"]
