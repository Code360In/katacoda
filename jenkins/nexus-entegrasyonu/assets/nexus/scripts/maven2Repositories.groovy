import org.sonatype.nexus.blobstore.api.BlobStoreManager
import org.sonatype.nexus.repository.storage.WritePolicy
import org.sonatype.nexus.repository.maven.VersionPolicy
import org.sonatype.nexus.repository.maven.LayoutPolicy


repository.createMavenHosted('maven-nexus-repo', 
        BlobStoreManager.DEFAULT_BLOBSTORE_NAME, 
        true, 
        VersionPolicy.MIXED,
        WritePolicy.ALLOW_WRITE, 
        LayoutPolicy.STRICT)

log.info('Script maven2Repositories completed successfully')