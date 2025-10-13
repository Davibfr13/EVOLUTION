# Usa Node 20 (necessário para Evolution API)
FROM node:20-bullseye

WORKDIR /app

# Copiar package.json e package-lock.json primeiro
COPY package*.json ./

# Instalar ferramentas do sistema
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

# 🚀 Instalar dependências sem executar scripts (evita erro do husky)
RUN npm install --omit=dev --ignore-scripts

# Copiar o restante do código
COPY . .

# Expor porta da Evolution API
EXPOSE 8080

# Iniciar a aplicação
CMD ["npm", "start"]
