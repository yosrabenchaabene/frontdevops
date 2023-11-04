# Utilisez une image Node.js comme image de base
FROM node:14

# Créez un répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier package.json et le fichier package-lock.json dans le conteneur
COPY package*.json ./

# Installez les dépendances
RUN npm install

# Copiez tout le reste de l'application dans le conteneur
COPY . .

# Exposez le port 4200 pour le serveur de développement Angular
EXPOSE 4200

# Commande pour démarrer l'application Angular
CMD ["ng", "serve"]
