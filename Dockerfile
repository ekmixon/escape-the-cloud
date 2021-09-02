FROM node:14.17.6-alpine3.11
WORKDIR /app
RUN npm install -g @aws-amplify/cli --unsafe-perm=true
COPY . /app
RUN yarn
EXPOSE 3000
RUN ["chmod", "+x", "/app/headless_init_env.sh"]
RUN ["chmod", "+x", "/app/headless_clean_env.sh"]
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/npm", "start"]