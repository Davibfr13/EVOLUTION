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

# 🧠 Detecta e gera o Prisma schema automaticamente
RUN if [ -f prisma/schema.prisma ]; then npx prisma generate --schema=prisma/schema.prisma; \
    elif [ -f src/prisma/schema.prisma ]; then npx prisma generate --schema=src/prisma/schema.prisma; \
    elif [ -f src/database/prisma/schema.prisma ]; then npx prisma generate --schema=src/database/prisma/schema.prisma; \
    else echo "❌ schema.prisma não encontrado"; exit 1; fi

# Expor a porta padrão da Evolution API
EXPOSE 8080

# Iniciar a API
CMD ["npm", "start"]
