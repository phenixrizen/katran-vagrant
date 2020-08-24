## Run
```
$ vagrant up
```
## SSH into VM
```
$ vagrant ssh
```

## Add VIPs
```
$ ifconfig eth0:1 192.168.4.22 netmask 255.255.255.0
$ ifconfig eth0:2 192.168.4.23 netmask 255.255.255.0
```

## Listen on two addresses
```
$ while true; do printf 'HTTP/1.1 200 OK\n\n%s' "$(date +%s)" | netcat -l 192.168.4.22 80; done
```
```
$ while true; do printf 'HTTP/1.1 200 OK\n\n%s' "$(date +%s)" | netcat -l 192.168.4.23 80; done
```

## Play with Katran example server/client that have been built in the VM

https://github.com/facebookincubator/katran/tree/master/example

```
sudo ./katran_server_grpc -balancer_prog ./balancer_kern.o -default_mac aa:bb:cc:dd:ee:ff \
    -lru_size=10000 -hc_forwarding=0 -intf=eth0 -port 50051
```

```
./katran_goclient -A -t 192.168.4.22:80 -rpc_port 50051
```