FROM node:9
USER node
WORKDIR /home/node/app
RUN npm config set prefix "/home/node/.npm-global"
RUN npm install -g secp256k1
RUN npm install -g libp2p-webrtc-star
CMD ["--host=webrtcstar", "--port=9090"]
ENTRYPOINT ["/home/node/.npm-global/bin/star-signal"]
