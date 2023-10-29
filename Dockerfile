# Utilisez une image de NGINX comme image de base
FROM nginx:latest

# Copiez les fichiers de votre application frontend dans le conteneur
COPY . /usr/share/nginx/html

# Exposez le port 80 (par défaut) sur lequel NGINX écoute
EXPOSE 80

# Commande pour démarrer NGINX
CMD ["nginx", "-g", "daemon off;"]
