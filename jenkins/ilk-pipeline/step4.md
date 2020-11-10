# Pipeline Adımları

Açılan **Konsol Çıktısı** sayfasında sol bölümde yer alan **Back to Project** linkine tıklayarak pipeline sayfasına geri dönün.

**Pipeline IlkPipeline** ekranında sol bölümde yer alan **Konfigürasyonu Düzenle** butonuna basarak pipeline düzenleme sayfasına geçin.

Açılan sayfada **Pipeline** bölümünde yer alan **Script** alanını aşağıdaki şekilde güncelleyin;

```
pipeline { 
  agent any 
    stages { 
        stage ('Build') { 
            steps { 
                echo 'Build adımı' 
            }
        }
        stage ('Test') { 
            steps { 
                echo 'Test adımı' 
            }
        }
        stage ('QA') { 
            steps { 
                echo 'QA adımı' 
            }
        }
        stage ('Deploy') { 
            steps { 
                echo 'Deploy adımı' 
            }
        }
        stage ('Monitor') { 
            steps { 
                echo 'Monitor adımı' 
            }
        }
 
    }           
 }
```

**Save**/**Kaydet** butonuna basarak pipeline tanımınızı güncelleyin.

**Pipeline IlkPipeline** ekranında sol bölümde yer alan **Şimdi Yapılandır** butonuna basarak pipeline'ı başlatın.

İşin sonlanması ardından **Stage View** bölümünde iş adımlarının yeşil olarak geldiğini teyit edin.