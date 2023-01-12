# Tire l'image Node du Docker
FROM node:14-slim

# Configuration du directoir de travil
WORKDIR /usr/app

# Copie onlsulment le package.json
COPY package*.json ./

# Instalation des Dependencies
RUN npm install

# Copie le restes du code dans le conteneur
COPY . .

#Exposition du port 
EXPOSE 4200

# Courri notre aplication
CMD ["npm", "run", "start-on-docker"]