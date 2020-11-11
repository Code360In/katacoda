# Jenkins Terminolojisi

**Agent** : Bir ajan, genellikle bir Jenkins ana sunucusuna (master) bağlanan ve ana sunucu tarafından yönlendirildiğinde görevleri yürüten bir makine veya konteyner'dır.

**Artifact** : Bir Build veya Pipeline çalışması sırasında oluşturulan ve daha sonra kullanıcılar tarafından geri alınmak üzere Jenkins Master'da arşivlenen değişmez bir dosya.

**Build** : Projenin tek bir yürütmesinin sonucu

**Downstream** : Bir Pipeline veya Projenin yürütülmesinin bir parçası olarak tetiklenen, yapılandırılmış bir Pipeline veya Proje.

**Executor** : Bir Node'daki Pipeline veya Proje tarafından tanımlanan işin yürütülmesi için bir yuvadır. Bir Node, sıfır veya daha fazla Executor (Yürütücü) sahibi olabilir ve bu, o Node'da kaç eşzamanlı Proje veya Pipeline yürütülebileceğine karşılık gelir.

**Folder** : Bir dosya sistemindeki klasörlere benzer şekilde, Pipeline ve/veya Projeler için bir kurumsal kapsayıcısıdır.

**Item** : Klasör, Pipeline veya Projeye karşılık gelen web kullanıcı arayüzündeki bir varlık.

**Job** : Project ile eşanlamlı olan, kullanımdan kaldırılmış bir terimdir.

**Label** : Ajanları benzer işlevsellik veya yeteneklere göre gruplamak için kullanıcı tanımlı metin. Örneğin, Linux tabanlı aracılar için linux veya Docker özellikli aracılar için docker.

**Master** : Yapılandırmayı depolayan, eklentileri yükleyen ve Jenkins için çeşitli kullanıcı arayüzlerini oluşturan merkezi, koordinasyon süreci.

**Node** : Jenkins ortamının bir parçası olan ve Pipeline veya Projeleri yürütebilen bir makine. Hem Master de Agent'lar Node olarak kabul edilir.

**Project** : Bir yazılım parçası oluşturmak vb. Jenkins'in gerçekleştirmesi gereken işin kullanıcı tarafından yapılandırılmış bir açıklaması.

**Pipeline** : Sürekli teslimat ardıl akışının kullanıcı tanımlı modelidir

**Plugin** : Jenkins Core'dan ayrı olarak sağlanan Jenkins işlevselliğinin bir uzantısı.

**Publisher** : Yapılandırılmış tüm adımların tamamlanmasından sonra Raporlar yayınlayan, bildirimler gönderen vs. bir Yapının parçası.

**Stage** : Pipeline'ın bir parçasıdır ve tüm Pipeline'ın kavramsal olarak farklı bir alt kümesini tanımlamak için kullanılır, örneğin: "Build", "Test" ve "Deploy", birçok eklenti tarafından Jenkins Pipeline durumunu / ilerlemesini görselleştirmek veya sunmak için kullanılır.

**Step** : Tek bir görev; temelde adımlar Jenkins'e bir Pipeline veya Proje içinde ne yapılacağını söyler.

**Trigger** : Yeni bir Pipeline çalıştırmasını veya Derlemeyi tetiklemek için bir kriter.

**Upstream** : Yürütülmesinin bir parçası olarak ayrı bir Pipeline veya Projeyi tetikleyen yapılandırılmış bir Pipeline veya Proje.

**Workspace** : Bir Node'un dosya sistemindeki, bir Pipeline veya Proje tarafından işin yapılabileceği tek kullanımlık bir dizin. Çalışma alanları genellikle bir Build veya Pipeline çalıştırması tamamlandıktan sonra, Jenkins Master'da belirli Çalışma Alanı temizleme ilkeleri uygulanmadıkça yerinde bırakılır.
