# LDAP Eklentisi Kurulumu

`sudo apt-get install -y erlang-eldap`{{execute}}

`rabbitmq-plugins enable rabbitmq_auth_backend_ldap`{{execute}}

```bash
cat > /etc/rabbitmq/rabbitmq.conf <<EOF
auth_backends.1 = ldap
auth_backends.2 = internal

auth_ldap.servers.1 = 127.0.0.1

auth_ldap.dn_lookup_bind.user_dn = uid=rabbitmq,ou=users,dc=enterprisecoding,dc=local
auth_ldap.dn_lookup_bind.password = enterprisecoding
auth_ldap.dn_lookup_attribute = uid
auth_ldap.dn_lookup_base = ou=users,dc=enterprisecoding,dc=local
EOF
```{{execute}}

`systemctl restart rabbitmq-server`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.