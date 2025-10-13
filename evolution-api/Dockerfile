# Usar Node LTS estável
FROM node:18-alpine

# Diretório de trabalho
WORKDIR /app

# Copiar arquivos de definição de dependências
COPY package*.json ./

# Instalar dependências
RUN npm install --production

# Copiar o restante do projeto
COPY . .

# Porta padrão da Evolution API
EXPOSE 8080

# Comando de inicialização
CMD ["npm", "start"]
