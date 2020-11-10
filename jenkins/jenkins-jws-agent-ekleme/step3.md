# Agent Kurulumu

Aşağıdaki adımarı takip ederek bir **node01** üzerinde Java Web Start Agent'ı başlatabilirsiniz.

Node01 makinesinde **/opt/jenkins/** dizinine gidin;

`cd /opt/jenkins/`{{execute HOST2}}

**agent.jar** dosyasını yerele indirin;

`wget http://master:8080/jnlpJars/agent.jar`{{execute HOST2}}

Jenkins arayüzünde Jenkins -> Nodes sayfasında listelenen node'lar arasından bir önceki adımda oluşturduğunuz **node01**'i seçin.

Açılan **Agent node01** sayfasında yer alan ikinci komutta bağlantı için gerekli token bilgisini **secret-file** dosyasına yazarak Agent başlatma komutlarına yerilmektedir. Bu bölümdeki ilk komutu kopyalayarak node01'de çalıştırın. Örneğin;

`echo 2163444291e41cc078d1212dd3c3f1df263455f3de4d8da476ce48dd93b2b5fe > secret-file`

Aşağıdaki komutla Node01'de Jenkins agent'ını başlatın;

`java -jar agent.jar -jnlpUrl http://master:8080/computer/node01/slave-agent.jnlp -secret @secret-file -workDir "/opt/jenkins/"`{{execute HOST2}}

Jenkins arayüzüne geri dönerek **Agent node01** sayfasını yenileyin. **Agent is connected.** mesajı ile agent'ı bağlı olduğunu teyit edin.