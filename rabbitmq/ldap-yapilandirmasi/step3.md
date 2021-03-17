# LDAP Logları

Aşağıdaki komutla **advanced.config** dosyasını güncelleyin. Dosyanın son bölümünde yer alan log girdisinin **true** olduğuna dikkat edin.

```bash
cat > /etc/rabbitmq/advanced.config <<EOF
[
  {rabbit, [{auth_backends, [rabbit_auth_backend_ldap, rabbit_auth_backend_internal]}]},
  {rabbitmq_auth_backend_ldap,
   [ 
        {servers,               ["127.0.0.1"]},
        {dn_lookup_base,        "ou=users,dc=enterprisecoding,dc=local"},
        {user_dn_pattern,       "cn=\${username},ou=users,dc=enterprisecoding,dc=local"},
        {other_bind,            {"cn=rabbitmq-app,ou=users,dc=enterprisecoding,dc=local","enterprisecoding"}},

        {vhost_access_query,    {in_group, "cn=access-permission-users,ou=\${vhost},ou=vhosts,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"}},
        {resource_access_query, {for, 
            [
                {permission, configure, {in_group, "cn=configure-permission-users,ou=\${vhost},ou=vhosts,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"}},
                {permission, write, {in_group, "cn=write-permission-users,ou=\${vhost},ou=vhosts,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"}},
                {permission, read, {in_group, "cn=read-permission-users,ou=\${vhost},ou=vhosts,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"}}
            ]
        }},
        {tag_queries, 
            [
                {administrator, {in_group, "cn=administrator,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"}},
                {management, {in_group, "cn=management,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"}}
            ]
        },

        {use_ssl,               false},
        {port,                  389},
        {log,                   true} 
    ]}
].
EOF
```{{execute}}

Değişikliklerin devreye girmesi için RabbitMQ'yu yeniden başlatın;

`rabbitmqctl stop_app`{{execute}}
`rabbitmqctl start_app`{{execute}}

Aşağıdaki komutla RabbitMQ loglarını ilemeye başlayın;

`tail -300f /var/log/rabbitmq/rabbit\@host01.log`{{execute}}

Yeniden yönetim arayüzüne geçiş yaparak kullanıcı adı olarak `rabbitmq-producer`{{copy}} şifre olarak `enterprisecoding`{{copy}} vererek giriş yapmayı deneyin.

Logda aşağıdaki girdilerin yer aldığını teyit edin;

```bash
 LDAP CHECK: login for rabbitmq-producer
         LDAP filling template "cn=${username},ou=users,dc=enterprisecoding,dc=local" with
            [{username,<<"rabbitmq-producer">>}]
         LDAP template result: "cn=rabbitmq-producer,ou=users,dc=enterprisecoding,dc=local"
     LDAP bind succeeded: cn=xxxx,ou=xxxx,dc=xxxx,dc=xxxx
         LDAP filling template "cn=${username},ou=users,dc=enterprisecoding,dc=local" with
            [{username,<<"rabbitmq-producer">>}]
         LDAP template result: "cn=rabbitmq-producer,ou=users,dc=enterprisecoding,dc=local"
     LDAP bind succeeded: cn=xxxx,ou=xxxx,dc=xxxx,dc=xxxx
     LDAP CHECK: does rabbitmq-producer have tag administrator?
     LDAP evaluating query: {in_group,"cn=administrator,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"}
     LDAP evaluating query: {in_group,"cn=administrator,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local","member"}
         LDAP filling template "cn=administrator,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local" with
            [{username,<<"rabbitmq-producer">>},{user_dn,"cn=rabbitmq-producer,ou=users,dc=enterprisecoding,dc=local"}]
         LDAP template result: "cn=administrator,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"
     LDAP evaluated in_group for "cn=administrator,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local": false
     LDAP DECISION: does rabbitmq-producer have tag administrator? false
     LDAP CHECK: does rabbitmq-producer have tag management?
     LDAP evaluating query: {in_group,"cn=management,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"}
     LDAP evaluating query: {in_group,"cn=management,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local","member"}
         LDAP filling template "cn=management,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local" with
            [{username,<<"rabbitmq-producer">>},{user_dn,"cn=rabbitmq-producer,ou=users,dc=enterprisecoding,dc=local"}]
         LDAP template result: "cn=management,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local"
     LDAP evaluated in_group for "cn=management,ou=tags,ou=rabbitmq,ou=app,dc=enterprisecoding,dc=local": false
     LDAP DECISION: does rabbitmq-producer have tag management? false
 LDAP DECISION: login for rabbitmq-producer: ok
 HTTP access denied: user 'rabbitmq-producer' - Not management user
```

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
