# ==========================
# Dockerfile Evolution API
# ==========================

# 1️⃣ Base image Node 20
FROM node:20-alpine

# 2️⃣ Diretório de trabalho
WORKDIR /app

# 3️⃣ Desativa Husky
ENV HUSKY=0

# 4️⃣ Copiar package.json e package-lock.json
COPY package*.json ./

# 5️⃣ Instalar dependências de produção sem rodar hooks do Husky
RUN npm install --omit=dev

# 6️⃣ Copiar todo o restante do código
COPY . .

# 7️⃣ Gerar cliente Prisma (ajuste caminho se necessário)
RUN if [ -f prisma/schema.prisma ]; then \
      npx prisma generate --schema=prisma/schema.prisma; \
    else \
      echo "❌ schema.prisma não encontrado, pule esta etapa"; \
    fi

# 8️⃣ Expor porta padrão da Evolution API
EXPOSE 8080

# 9️⃣ Comando para iniciar a API
CMD ["npm", "start"]
