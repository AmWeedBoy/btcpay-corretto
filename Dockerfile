FROM btcpayserver/docker-compose-generator:latest

RUN mkdir -p /opt/btcpayserver && \
    cd /opt/btcpayserver && \
    ./btcpay-setup.sh --install \
        --btcpay-env "BTCPAY_HOST=https://btcpay.corretto.sk" \
        --nbxplorer-network mainnet \
        --btcpay-network mainnet \
        --btcpay-crypto btc \
        --btcpay-lightning none \
        --btcpay-nginx true \
        --postgres 0 \
        --opt-save-storage

ENTRYPOINT ["/bin/bash", "-c", "/opt/btcpayserver/btcpay-down.sh && /opt/btcpayserver/btcpay-up.sh"]
