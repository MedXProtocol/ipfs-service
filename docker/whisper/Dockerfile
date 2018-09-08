FROM ethereum/client-go:alltools-stable
ENTRYPOINT ["geth"]
CMD [\
  "--shh", \
  "--shh.pow", "0.1", \
  "--nodiscover", \
  "--maxpeers", "0", \
  "--ws", \
  "--wsapi", "eth,net,shh,web3", \
  "--wsorigins", "*", \
  "--wsaddr", "0.0.0.0" \
  ]
