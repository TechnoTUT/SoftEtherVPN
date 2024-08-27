# SoftEtherVPN
## About
This repository is a docker-based SoftEther VPN server.  
## Usage
### Prerequisites
- Podman
- Podman-compose
- Podman-Plugins
### Pulling this repository and starting the container
```bash
git clone https://github.com/TechnoTUT/SoftEtherVPN.git
cd SoftEtherVPN
sudo sysctl -w net.ipv4.ip_unprivileged_port_start=443
sudo sysctl -w kernel.dmesg_restrict=0
podman-compose up -d
```
### Setting up the VPN server
Windows: Use `SoftEther VPN Server Manager` to connect to the server and set it up.  
Mac, Linux: Use the `vpncmd` command to connect to the server and set it up.  
Connect: `<ip-address>:443`  

If you want to set up the VPN server via local machine, you can use the following command:
```bash
podman exec -it vpn /usr/local/vpnserver/vpncmd
```

### Stopping the container
```bash
podman-compose down
```