# 🏗️ Etapa base: Node com suporte ao Prisma e TSX
FROM node:20-alpine

# 📂 Definir diretório de trabalho
WORKDIR /app

# ⚙️ Copiar apenas os arquivos essenciais para instalar dependências
COPY package*.json ./

# 🧩 Instalar dependências de produção
RUN npm install --production

# 📦 Copiar o restante do código
COPY . .

# 🧠 Garantir que o schema.prisma exista (baixar se estiver ausente)
RUN if [ ! -f prisma/schema.prisma ] && [ ! -f src/prisma/schema.prisma ] && [ ! -f src/database/prisma/schema.prisma ]; then \
      echo "📥 Baixando schema.prisma padrão da Evolution API..."; \
      mkdir -p src/database/prisma && \
      wget -q -O src/database/prisma/schema.prisma https://raw.githubusercontent.com/EvolutionAPI/evolution-api/main/src/database/prisma/schema.prisma; \
    else \
      echo "✅ schema.prisma encontrado localmente."; \
    fi

# ⚙️ Detectar e gerar cliente Prisma automaticamente
RUN if [ -f prisma/schema.prisma ]; then \
      npx prisma generate --schema=prisma/schema.prisma; \
    elif [ -f src/prisma/schema.prisma ]; then \
      npx prisma generate --schema=src/prisma/schema.prisma; \
    elif [ -f src/database/prisma/schema.prisma ]; then \
      npx prisma generate --schema=src/database/prisma/schema.prisma; \
    else \
      echo "❌ Nenhum schema.prisma encontrado!"; exit 1; \
    fi

# 🌐 Expor porta padrão da Evolution API
EXPOSE 8080

# ▶️ Comando de inicialização
CMD ["npm", "start"]
