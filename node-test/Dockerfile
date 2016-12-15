FROM node:alpine
MAINTAINER Bradley Leonard <bradley@leonard.pub>

# make the src folder available in the docker image
ADD src/ /src
WORKDIR /src

# install dependencies
RUN npm install

# make port 80 available outside of the image
EXPOSE 80

# start node with the index.js file of our hello-world application
CMD ["node", "index.js"]
