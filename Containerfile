FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y build-essential curl \
    && curl -O https://jp.softether-download.com/files/softether/v4.42-9798-rtm-2023.06.30-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.42-9798-rtm-2023.06.30-linux-x64-64bit.tar.gz \
    && mv softether-vpnserver-v4.42-9798-rtm-2023.06.30-linux-x64-64bit.tar.gz softether-vpnserver.tar.gz \
    && tar -xzvf softether-vpnserver.tar.gz \
    && cd vpnserver \
    && (echo 1; echo 1) | make \
    && cd .. \
    && mv vpnserver /usr/local/ \
    && rm -rf softether-vpnserver.tar.gz \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y \
    && cd /usr/local/vpnserver \
    && chmod 600 * \
    && chmod 700 vpncmd \
    && chmod 700 vpnserver

FROM debian:12-slim
COPY --from=0 /usr/local/vpnserver /usr/local/vpnserver
WORKDIR /usr/local/vpnserver
RUN (echo 3; echo "check"; echo "exit") | ./vpncmd
CMD [ "/usr/local/vpnserver/vpnserver", "execsvc" ]