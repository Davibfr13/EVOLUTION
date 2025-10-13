# ===============================
# Dockerfile para Evolution API
# ===============================

# Usar Node 20+ Alpine leve
FROM node:20-alpine

# Diretório de trabalho
WORKDIR /app

# Desativar Husky (evita erro no npm install)
ENV HUSKY=0

# Copiar apenas package.json e package-lock.json para cache
COPY package*.json ./

# Instalar dependências de produção
RUN npm install --omit=dev

# Copiar restante do código
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

# Expor porta padrão da Evolution API
EXPOSE 8080

# Comando padrão para iniciar a API
CMD ["npm", "start"]
