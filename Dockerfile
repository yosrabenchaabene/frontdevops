# Étape 1 : Utilisez une image Node.js comme image de base pour la génération de l'application
FROM node:14 as build-step
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Étape 2 : Utilisez une image Nginx pour servir l'application Angular
FROM nginx:alpine
COPY --from=build-step /app/dist /usr/share/nginx/html
EXPOSE 4200
