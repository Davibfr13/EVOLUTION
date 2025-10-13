# ==========================
# Dockerfile Evolution API
# ==========================

# 1️⃣ Base image com Node 20
FROM node:20-alpine

# 2️⃣ Diretório de trabalho
WORKDIR /app

# 3️⃣ Desativa Husky (evita erros de prepare hooks)
ENV HUSKY=0

# 4️⃣ Copiar package.json e package-lock.json para instalar dependências
COPY package*.json ./

# 5️⃣ Instalar dependências de produção
RUN npm install --omit=dev

# 6️⃣ Copiar todo o restante do código
COPY . .

# 7️⃣ Gerar cliente Prisma (ajuste o caminho se seu schema estiver em outro lugar)
RUN if [ -f prisma/schema.prisma ]; then \
      npx prisma generate --schema=prisma/schema.prisma; \
    else \
      echo "❌ schema.prisma não encontrado, verifique o caminho"; \
    fi

# 8️⃣ Expor a porta padrão da Evolution API
EXPOSE 8080

# 9️⃣ Comando padrão para iniciar a Evolution API
CMD ["npm", "start"]
