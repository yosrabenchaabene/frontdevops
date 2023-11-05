# Utilisez une image Node.js comme image de base
FROM node:14

# Créez un répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier package.json et le fichier package-lock.json dans le conteneur
COPY package.json ./

# Installez les dépendances
RUN npm install

# Copiez tout le reste de l'application dans le conteneur
COPY . .
RUN npm run build

# Étape 2 : Utilisez une image Nginx pour servir l'application Angular
FROM nginx:alpine as prod-step
COPY --from=build-step app/dist/crud-tuto-Front /usr/share/nginx/html
EXPOSE 4200


