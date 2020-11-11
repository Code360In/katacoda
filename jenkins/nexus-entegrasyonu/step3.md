# Jenkins Pipeline'ı Oluşturma

Ana sayfaya gidin. Bu sayfada **New Item**/**Yeni Item** linkine basın.

Açılan ekranda **Enter an item name** bölümünde değer olarak **ArtifactPipeline** yazın.

İş türü olarak **Pipeline** seçerek **OK** tuşuna basın.

## Pipeline

**Pipeline** bölümünde yer alan **Definition** combobox'ında bulunan **Pipeline Script** değerini seçin. Script olarak ise aşağıdaki ifadeyi girin;

```
pipeline {
    agent any
    tools {
        maven "Maven"
    }
    stages {
        stage("Projeyi Klonla") {
            steps {
                script {
                    git 'https://github.com/javaee/cargotracker.git';
                }
            }
        }
        stage("Maven Build") {
            steps {
                script {
                    sh "mvn package -DskipTests=true"
                }
            }
        }
        stage("Artifact Yayınla") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artifactPath = filesByGlob[0].path;
                    artifactExists = fileExists artifactPath;
                    if(artifactExists) {
                        echo "*** Dosya: ${artifactPath}, grup: ${pom.groupId}, paket: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                            nexusVersion: "nexus3",
                            protocol: "http",
                            nexusUrl: "nexus:8081",
                            groupId: pom.groupId,
                            version: pom.version,
                            repository: "maven-nexus-repo",
                            credentialsId: "nexus-user-credentials",
                            artifacts: [
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );
                    } else {
                        error "*** Dosya: ${artifactPath}, bulunamadı";
                    }
                }
            }
        }
    }
}
```

Son olarak **Save**/**Kaydet** butonuna basarak ilk pipeline tanımınızı oluşturun.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.