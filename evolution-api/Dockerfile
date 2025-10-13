# Usa Node 20 (obrigatório para Evolution API)
FROM node:20-bullseye

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependência primeiro
COPY package*.json ./

# Instala dependências do sistema necessárias para módulos nativos
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

# Instala dependências de produção
RUN npm install --omit=dev

# Copia o restante dos arquivos do projeto
COPY . .

# Expõe a porta padrão da Evolution API
EXPOSE 8080

# Inicia o servidor
CMD ["npm", "start"]
