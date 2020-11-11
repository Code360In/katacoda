# Başarısız Analiz Sonuçları

Proje kaynak koduna giderek PrimeService/PrimeService.cs dosyasını açın. Dosya içerisine 9. satırı aşağıdaki şekilde ekleyin;

`int kullanilmayan_ve_uzun_bir_isme_sahip_degisken = 1;`

Kodun güncel hali aşağıdaki şekilde olacaktır;

```
using System;

namespace Prime.Services
{
    public class PrimeService
    {
        public bool IsPrime(int candidate)
        {
            int kullanilmayan_ve_uzun_bir_isme_sahip_degisken = 1;
            if (candidate < 2)
            {
                return false;
            }

            for (var divisor = 2; divisor <= Math.Sqrt(candidate); divisor++)
            {
                if (candidate % divisor == 0)
                {
                    return false;
                }
            }
            return true;
        }
    }
}
```

Jenkins arayüzüne geçerek DotNetAnaliz projesini yeniden yapılandırın.

SonarQube arayüzüne geçerek statik kod analizinin başarısız olarak sonuçlandığını teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.