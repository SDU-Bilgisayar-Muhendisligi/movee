# İmajı belirle
FROM node:18-alpine

# Uygulama klasörünü oluştur
WORKDIR /app

# package.json ve yarn.lock (veya npm-shrinkwrap.json) dosyalarını kopyala
COPY package.json yarn.lock* ./

# Bağımlılıkları yükle (yarn kullanarak)
RUN yarn install 

# Uygulama kodunu kopyala
COPY . .

# Yapılandırma ve derleme
RUN yarn build

# Ortama bağlı olarak çalışma komutunu belirle
CMD [ "yarn", "dev" ]
