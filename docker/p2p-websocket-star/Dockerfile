FROM node:9
USER node
WORKDIR /home/node/app
RUN npm config set prefix "/home/node/.npm-global"
RUN npm install -g secp256k1
RUN npm install -g libp2p-websocket-star-rendezvous
CMD ["--host=websocketstar", "--port=9091"]
ENTRYPOINT ["/home/node/.npm-global/bin/rendezvous"]
