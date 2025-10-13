# Usa uma imagem mais completa para evitar erros de build
FROM node:18-bullseye

# Diretório de trabalho
WORKDIR /app

# Copiar arquivos de dependência primeiro
COPY package*.json ./

# Instalar ferramentas necessárias para compilar dependências nativas
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

# Instalar dependências do projeto
RUN npm install --omit=dev

# Copiar o restante do código
COPY . .

# Expor a porta padrão da Evolution API
EXPOSE 8080

# Comando para iniciar a API
CMD ["npm", "start"]
