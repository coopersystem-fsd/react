FROM node:alpine

RUN apk update
RUN apk add --no-cache openssl bash nodejs npm

# Create app directory
WORKDIR /usr/src/front

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#COPY ./front/package*.json /usr/src/front
COPY package.json /usr/src/front
RUN npm --no-cache install

#To bundle your app’s source code inside the Docker image, use the COPY instruction:
COPY . .

#Your app binds to port 3000 so you’ll use the EXPOSE instruction to have it mapped by the docker daemon:
EXPOSE 3000

##CMD ["npm", "start"]
RUN npm start
