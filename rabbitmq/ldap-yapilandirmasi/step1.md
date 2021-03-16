# LDAP Eklentisi Kurulumu

LDAP bağlantısı için gerekli erlang modülünü aşağıdaki komutla kurun;

`sudo apt-get install -y erlang-eldap`{{execute}}

Aşağıdaki komutla RabbitMQ LDAP eklentisini kurunİ

`rabbitmq-plugins enable rabbitmq_auth_backend_ldap`{{execute}}

Aşağıdaki komutla RabbitMQ'yu yetkilendirmede öncelikle LDAP, ardından da iç veritabanı kullanıcılarını yetkilendirecek şekilde yapılandırın;

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

```bash
cat > /etc/rabbitmq/advanced.config <<EOF
[
  {rabbit, [{auth_backends, [rabbit_auth_backend_ldap, rabbit_auth_backend_internal]}]},
  {rabbitmq_auth_backend_ldap,
   [ {servers,               ["127.0.0.1"]},
     {dn_lookup_base,        {"u=users,dc=enterprisecoding,dc=local"}},
     {dn_lookup_attribute,   {"uid"}},
     {other_bind,            ["uid=rabbitmq,ou=users,dc=enterprisecoding,dc=local","enterprisecoding"]},

     {vhost_access_query,    {in_group, "cn=access-permission-users,ou=${vhost},ou=vhosts,ou=rabbitmq,dc=enterprisecoding,dc=local"}},
     {resource_access_query, {for, [
         {permission, configure, {in_group, "cn=configure-permission-users,ou=${vhost},ou=vhosts,ou=rabbitmq,dc=enterprisecoding,dc=local"}},
         {permission, write, {in_group, "cn=write-permission-users,ou=${vhost},ou=vhosts,ou=rabbitmq,dc=enterprisecoding,dc=local"}},
         {permission, read, {in_group, "cn=read-permission-users,ou=${vhost},ou=vhosts,ou=rabbitmq,dc=enterprisecoding,dc=local"}},
       ]
     }},
     {tag_queries,           [
         {administrator, {in_group, "cn=administrator,ou=tags,ou=rabbitmq,dc=enterprisecoding,dc=local"}},
         {management, {in_group, "cn=management,ou=tags,ou=rabbitmq,dc=enterprisecoding,dc=local"}},
        ]
      },

     {use_ssl,               false},
     {port,                  389},
     {log,                   false} ] }
].
EOF
```{{execute}}

Değişikliklerin devreye girmesi için RabbitMQ'yu yeniden başlatın;

`rabbitmqctl stop_app`{{execute}}
`rabbitmqctl start_app`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.