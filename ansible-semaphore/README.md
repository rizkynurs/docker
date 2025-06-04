<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg"/>
</p>

## How to run ansible script 

```
cd playbook/
```

```
ansible-playbook -i ~/.ansible/hosts test.yml --ask-pass -K
```

define host that we need to setup configuration

default ansible host ~/.ansible/hosts

```
➜  ~ » cat .ansible/hosts
[webserver]
172.16.129.128 ansible_user=client01

[oprekan]
192.168.1.160 ansible_user=root
```

If needed to project task (clone project)
```
ansible-playbook -i ~/.ansible/hosts publish.yml --ask-pass -K --ask-vault-pass
```