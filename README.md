# test ansible on arm platform

## account

- root:root
- admin:admin

## NOTES

python is not installed in target, so only raw and script modules are available.

## step

- sudo ./run.sh # start qemu
- ifconfig eth0 192.168.100.10

another terminal

- leo@leo-vm:~/work/ansible-cn/playbook$ ansible n1 -m raw -a "touch /tmp/ansible.txt" -i inventory.ini
```
192.168.100.10 | SUCCESS | rc=0 >>
Shared connection to 192.168.100.10 closed.
```
- ansible n1 -m script -a /home/leo/work/ansible-cn/playbook/test_script_module.sh -i inventory.ini #test script module
```
192.168.100.10 | SUCCESS => {
    "changed": true,
    "rc": 0,
    "stderr": "Shared connection to 192.168.100.10 closed.\r\n",
    "stdout": "",
    "stdout_lines": []
}
```
