# Use a imagem oficial do Node.js
FROM node:18-alpine

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de configuração do package
COPY package*.json ./
COPY yarn.lock ./

# Instala as dependências
RUN npm install -g pm2
RUN npm install

# Copia todo o código fonte
COPY . .

# Cria diretório para logs
RUN mkdir -p logs

# Expõe a porta (a mesma que a Evolution API usa)
EXPOSE 8080

# Define variáveis de ambiente
ENV NODE_ENV=production
ENV PORT=8080

# Comando para iniciar a aplicação com PM2 (recomendado para produção)
CMD ["pm2-runtime", "start", "ecosystem.config.js", "--env", "production"]