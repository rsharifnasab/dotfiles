# check connections and connect to networks

# GUI
do everything in terminal UI:
```bash
nmtui
```

# enable or disable network
```bash
nmcli networking off
nmcli networking on
```

or just wifi:
```bash
nmcli radio wifi on
nmcli radio wifi off
```

# query information
## am I conencted or not
```bash
nmcli general status
```

## active connection name and UUID
```bash
nmcli connection show --active
```

## adaptors and their active connection
```bash
nmcli device status
```

## retrieve password (only current wifi)
```bash
nmcli device wifi show-password
```

## monitor events
```bash
nmcli monitor
```

# connect to network


## connect the second time
```bash
nmcli connection up <name>
```

## connect for the first time
```bash
nmcli device wifi rescan
# or with list:
nmcli device wifi list --rescan yes

nmcli device wifi connect <name> password <pass>

```

## disconnect
``bash
nmcli connection down <name>
```


# show available connections
```bash
nmcli device wifi list
nmcli device wifi list --rescan yes
```
