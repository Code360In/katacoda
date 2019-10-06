# Network Namespace Oluşturulması

Network namespace kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Network Namespace

Linux **Namespace**'leri kernel kaynaklarını bölümlere ayırmaya olanak sağlayan bir Kernel özelliğidir. Farklı namespace'lere bağlı çalışan process'ler farklı kernel kaynaklarını görecektir. Linux Kernel'ı 6+1 farklı namespace'e sahiptir. Aşağıdaki adımlarda bu namespace'lerden **Network Namespace**'ini deneyimleyeceksiniz.

Senaryomuzda bir network namespace'i oluşturarak burada iptables ile yaptığımız değişikliklerin diğer network namespace'lerini etkilemediğini deneyimleyeceksiniz.

## Bir Network Namespace Oluşturulması

Senaryomuzda network namespace kernel kaynak ayrımını net olarak görebilmek adına öncelikle bir network namespace'i oluşturulmalıdır. Network namespace'i şu şekildeki bir komutla oluşturulur;

`sudo ip netns add [NAMESPACE ADI]`

Aşağıdaki komutla `enterprisecodingNNS` adıyla bir network namespace'i oluşturun;

`sudo ip netns add enterprisecodingNNS`{{execute}}

Network namespace'lerini listeleyerek yeni oluşturduğumuz namespace'in listede olduğu kontrol edin;

`sudo ip netns list`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
