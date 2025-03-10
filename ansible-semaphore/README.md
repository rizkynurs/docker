<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg"/>
</p>

## How to run ansible script 

```
cd playbook/cnn/
```

```
ansible-playbook -i ~/.ansible/hosts cnn.yml --ask-pass -K
```

define host that we need to setup configuration

default ansible host ~/.ansible/hosts

```
[14:00] saras008  ➜  ~ » cat .ansible/hosts
[webserver]
172.16.129.128 ansible_user=client01

[oprekan]
192.168.1.160 ansible_user=root
```

If needed to project task (clone project)
```
ansible-playbook -i ~/.ansible/hosts publish.yml --ask-pass -K --ask-vault-pass
```
The password is in detikeknetworks sheet.

## How to run Playbook via Repositories

➜  add this repo to repositories menu
```
https://gitlab-ci-token:TTgyKznV6yxy1Y3_8zFx@git-sysnet.detik.com/sysnet/ansible-semaphore.git
```

➜  pilih branch "master" dan Access Key "None"

➜  ketika nanti running "Task Template" path Playbook Filename menjadi "playbook/(namefile)./yml" atau "playbook/(folder)/(namefile).yml"