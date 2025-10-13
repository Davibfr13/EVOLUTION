FROM node:20-alpine
WORKDIR /app

# Ignorar Husky no build
ENV HUSKY=0

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências de produção
RUN npm install --omit=dev

# Copiar restante do código
COPY . .

# Gerar cliente Prisma (ajustar caminho do schema)
RUN if [ -f prisma/schema.prisma ]; then \
      npx prisma generate --schema=prisma/schema.prisma; \
    elif [ -f src/prisma/schema.prisma ]; then \
      npx prisma generate --schema=src/prisma/schema.prisma; \
    elif [ -f src/database/prisma/schema.prisma ]; then \
      npx prisma generate --schema=src/database/prisma/schema.prisma; \
    else \
      echo "❌ schema.prisma não encontrado"; exit 1; \
    fi

EXPOSE 8080
CMD ["npm", "start"]
