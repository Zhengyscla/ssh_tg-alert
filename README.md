# ssh_tg-alert

懒得写那么复杂了，看懂就行

ssh 登录的 telegram 通知

Debian 使用 `ssh-telegram-notify_deb.sh` ，Alpine 使用 `ssh-telegram-notify_alp.sh`

确保系统已经安装好 `curl`

```bash
cd /usr/local/bin/
wget https://raw.githubusercontent.com/Zhengyscla/ssh_tg-alert/refs/heads/main/ssh-telegram-notify_deb.sh
wget https://raw.githubusercontent.com/Zhengyscla/ssh_tg-alert/refs/heads/main/ssh-telegram-notify_alp.sh
```

在里面编辑好 Bot Token 和你的 ID

Debian:

```bash
nano /etc/pam.d/sshd
```

最后一行加上：

```
session optional pam_exec.so /usr/local/bin/ssh-telegram-notify_deb.sh
```

Alpine:

```
nano /etc/profile
```

最后一行加上：

```
[ -n "$SSH_CONNECTION" ] && /usr/local/bin/ssh-telegram-notify.sh
```
