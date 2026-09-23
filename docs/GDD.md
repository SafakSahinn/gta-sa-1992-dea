# GTA SA: 1992 DEA Mod — Proje Tasarım Belgesi v2

> **v2 notu (2026-09-23):** Bu sürüm, v1'deki (`gta-sa-1992-dea-mod-detayli-gdd.md`) hikâyeyi ve diyalogları korur; coğrafya, para, zaman çizelgesi, tuş ve kurgu tutarsızlıkları düzeltilmiştir. Yapılan her değişiklik **Bölüm 7 — Değişiklik Kaydı**'nda listelenir. Henüz karar verilmemiş konular **Bölüm 6 — Açık Kararlar**'dadır ve metinde `[AÇIK]` etiketiyle işaretlidir.

---

## 1. TEMEL ÇERÇEVE

| Başlık | Karar |
|---|---|
| Oyun | GTA San Andreas (PC, v1.0 US — mod uyumluluğu için) |
| Harita | Oyunun **orijinal haritası**. Bölüm 1–2 tamamen **Los Santos**'ta geçer. (Project Eagle, eyaletler arası bölümler için ileride değerlendirilecek.) |
| Dönem | 1992 — CJ'in hikâyesiyle aynı yıl, aynı şehir |
| Teknik altyapı | **CLEO scriptleri** (Sanny Builder ile). Orijinal `main.scm`'ye dokunulmaz. |
| Kanon bağı | Ballas (sokak), Loco Syndicate'in tedarikçi karteli (sevkiyat), Frank Tenpenny / C.R.A.S.H. (yozlaşmış yolun kapısı) |

### 1.1 Karakter Kadrosu

* **Raymond "Ray" Cross (35):** DEA ajanı. Rozetine ve kanunlara sadık, sistemin yıprattığı, ailesini korumak için her şeyi göze alabilecek dürüst bir baba. `[AÇIK: etnik köken]`
* **Sarah Cross (33):** Ray'in eşi. **Akciğer kanseri.** All Saints General Hospital'da deneysel kemoterapi protokolü için **Cuma 10:00'a kadar $12,500 ön ödeme** gerekiyor. Ray'in federal sağlık sigortası bu protokolü "deneysel tedavi, kapsam dışı" gerekçesiyle reddetti.
* **Danny Cross (10):** Oğulları. Babasını kahramanı olarak görür; annesinin hastalığı yüzünden erken olgunlaşmıştır.
* **Ajan Miller:** Ray'in dürüst ve sadık ortağı.
* **Amir Garcia:** LSPD/DEA Ortak Görev Gücü amiri. Eyalet, görev gücü fonunu %20 kestiği için çaresiz.
* **Dr. Evans:** All Saints General Hospital'da Sarah'ın doktoru.
* **Slick:** Idlewood/Jefferson hattında sokak muhbiri ($20 karşılığı bilgi satar).
* **Kartel Teğmeni:** Loco Syndicate'e mal sağlayan kartelin Ocean Docks sorumlusu. Ballas'ın toptancısı.
* **Frank Tenpenny (kanon, kamera arkası):** C.R.A.S.H. memuru. Bölüm 1'de kısa bir görünüm yapar; Yozlaşmış Yol'da Ray'i piyonu yapar.

---

## 2. OYUN İÇİ DONANIM VE ARAYÜZ

> Tuşların hepsi **geçicidir**; Faz 1'de SA'nın varsayılan kontrolleriyle çakışma testi yapılıp kesinleşecek.

| Donanım | Tuş (geçici) | İşlevi |
|---|---|---|
| **Polis Cep Defteri** | `B` *(v1'de N idi — N, SA'nın "Hayır" tuşu)* | Deri kaplı, el yazısı defter. Sayfa 1: telsiz anonsları ve vaka notları. Sayfa 2: şüpheli ve muhbir ifadeleri. Sayfa 3: kişisel notlar ve borç listesi. |
| **Tuğla Telefon** (Motorola MicroTAC 9800X) | `P` | Sadece **sesli arama**: Sarah, Danny, Amir Garcia, Miller, Dr. Evans, Slick. *(1992'de tüketici SMS'i yoktu; yazılı mesajlar pager'a taşındı.)* |
| **Pager** | otomatik | Hastane ve büro mesajları. Ekran büyük harf ve Türkçe karaktersiz: `KALAN 41 SAAT`. |
| **Banka ATM terminali** | `E` (ATM önünde) | 1992 yeşil CRT ekranı. Bakiye ve borç görüntüleme. *(v1'deki "Fleeca" GTA V'e ait; kaldırıldı.)* |
| **MDT araç bilgisayarı** | `TAB` (araç içinde) | Ray'in sivil DEA Premier'ında. Plaka sorgulama, şüpheli veritabanı, devriye anonsları, teslim edilen kanıt kaydı. |
| **Etkileşim** | `E` | Üst/araç arama, kelepçeleme, araca bindirme |
| **Kader kararı** | `Y` / `N` | SA'nın kendi evet/hayır tuşları. Çakışma yok, oyunun diline uyuyor. |

---

## 3. EKONOMİ, ZAMAN VE AHLAK SİSTEMLERİ

### 3.1 Para (ilk sürümde tek "bakiye")

| Kalem | Tutar | Not |
|---|---|---|
| Başlangıç bakiyesi | **$450** | Çarşamba sabahı |
| Haftalık net maaş | **$950** | Pazartesi yatar, yani son ödeme gününden **sonra** |
| Ev ipoteği | **-$850** | Pazartesi maaşından kesilecek |
| Faturalar | **-$120** | Pazartesi |
| Hastane ön ödemesi | **-$12,500** | **Cuma 10:00** son gün |
| Yasal kanıt primi | **$15–20 / paket** | Amir Garcia'nın uygulayabildiği tek ödeme |

> Pazartesi maaşı ($950), ipotek ve faturayı ($970) bile karşılamıyor. Oyuncu "maaşı bekleyip ödeyeyim" yolunun kapalı olduğunu ilk ATM ekranında görür.

**Yasal yolla bakiye akışı (dürüst oynayan oyuncu):**

| An | Olay | Değişim | Bakiye |
|---|---|---|---|
| Çar 07:30 | Başlangıç | — | **$450** |
| Çar 10:15 | Idlewood: 3 crack tüpü teslim (3 × $15) | +$45 | **$495** |
| Çar 14:30 | Slick'e muhbir parası | -$20 | **$475** |
| Çar 15:15 | Motel baskını primi | +$85 | $560 |
| Çar 15:15 | $100 ahlak testi → [B] kanıta koy (bildirim primi) | +$15 | **$575** |
| Perşembe | Serbest devriye (oyuncuya göre) | +$100–250 | ~$700–825 |
| Per 22:45 | Ocean Docks | — | $12,500'a hâlâ ~$11,700 eksik |

* Şüpheliden çıkan **$45 kayıt dışı nakit kanıttır**, Ray'e geçmez.
* [A] seçilirse (parayı cebe at): $475 + $85 + $100 = **$660**, Yozlaşma +2.
* Sahne notları ve defter yazıları bakiyeyi **değişkenden** okur, sabit rakam yazılmaz.

### 3.2 Zaman çizelgesi ve geri sayım

**Son gün: Cuma 10:00.** Bütün pager mesajları bu ana göre hesaplanır.

| An | Kalan süre | Pager metni |
|---|---|---|
| Çar 10:15 | 47 sa 45 dk | `ALL SAINTS: SARAH CROSS ODEME YOK. SON GUN CUMA 10:00` |
| Çar 16:30 | 41 sa 30 dk | `ALL SAINTS: KALAN 41 SAAT. $12,500 ODENMEDI` |
| Per 18:00 | 16 sa | `ALL SAINTS: KALAN 16 SAAT` |
| Per 22:45 | 11 sa 15 dk | `ALL SAINTS: KALAN 11 SAAT` |

### 3.3 Ahlak göstergesi — tek değişken: `YOZLASMA` (0–100)

v1'de "Şeref Puanı" ve "Yozlaşma Seviyesi" ayrı ayrı geçiyordu. v2'de **tek değişken** var; ekranda gösterilen "Şeref" = 100 − Yozlaşma.

| Aralık | Durum | Dünyanın tepkisi |
|---|---|---|
| 0–24 | **Temiz** | Telsiz desteği eksiksiz |
| 25–49 | **Gri** | Torbacılar rüşvet teklif etmeye başlar |
| 50–74 | **Kirli** | Delil karartma seçenekleri açılır, İç İşleri ilgilenir |
| 75–100 | **Rozetli baron** | Sokak çeteleri haraç öder |

| Eylem | Etkisi |
|---|---|
| Kayıt dışı $100'ı cebe atmak | +2 |
| Silahsız kaçan şüpheliye ateş (orantısız güç) | +5, -$300 ceza, İç İşleri soruşturması |
| Zengin bölgede haksız arama (şikâyet çıkarsa) | -$200 ile -$350 tazminat, amir azarı (Yozlaşma değişmez) |
| Kırılma noktası: Yozlaşmış Yol | Yozlaşma **en az 50**'ye çıkar |

### 3.4 Çekirdek polis mekanikleri

* **Üst ve araç arama (`E`):** Şüpheli duvara/araca yaslanır. Sonuç olasılıkları: %70 teslim olur, %20 koşarak kaçar, %10 silah çeker. **Bu olasılıklar sadece serbest devriyede geçerli**; hikâye sahnelerinde sonuç senaryoya bağlıdır.
* **Yaya kovalamaca ve teslim olma:** Kaçamayacağını anlayan şüpheli ellerini kaldırıp diz çöker. `E` ile kelepçelenir, araca bindirilir, büroya teslim edilince prim ödenir.
* **Orantısız güç kuralı:** Silahsız kaçan şüpheliye ateş etmek yasak. Cezası Bölüm 3.3'te.
* **Zengin bölge şikâyet riski (Rodeo / Vinewood / Mulholland):** Üstünden bir şey çıkmayan sivili aramak %10–15 ihtimalle şikâyete dönüşür.
* **İleri aşama (Yozlaşmış Yol):** İç İşleri'ne rüşvet, yargı bağlantıları, video kiralama dükkânı (VHS) üzerinden para aklama, All Saints ve kilise bağışlarıyla "hayırsever kahraman" imajı.

---

## 4. MEKÂNLAR (orijinal SA haritası)

| Mekân | Bölge | Oyundaki durum | Not |
|---|---|---|---|
| Cross ailesinin evi | **Jefferson** | Hazır ev iç mekânlarından biri kullanılacak | v1'de Commerce'teydi; Commerce iş bölgesi. Kesin bina Faz 1'de seçilecek. |
| LSPD/DEA bürosu | Pershing Square | LSPD iç mekânı mevcut | |
| Idlewood benzinlik arkası | Idlewood | Mevcut, Ballas bölgesi | |
| All Saints General Hospital | Market | **İç mekânı yok** | Doktor sahnesi dış çekim + başka bir iç mekân ile çözülecek `[AÇIK]` |
| Jefferson Motel | Jefferson | İç mekân mevcut (Faz 1'de doğrulanacak) | v1'deki "Garcia Motel" yerine. Garcia San Fierro'da. |
| Ocean Docks 4. Ambar | Ocean Docks | Dış alan mevcut | Konteyner içi için birkaç obje eklenecek |

---

## 5. HİKÂYE VE DİYALOGLAR

### Bölüm ve görev yapısı

| Bölüm / Görev | Ad | Gün | İçerik |
|---|---|---|---|
| Bölüm 1 / Görev 1 | Rutin Devriye ve Bakiye Şoku | Çarşamba sabah–öğle | Ev, büro, Idlewood devriyesi, hastane, $495 şoku |
| Bölüm 1 / Görev 2 | Sınırların Zorlanması | Çarşamba öğleden sonra | Slick, Jefferson Motel baskını, $100 ahlak testi, $575, sevkiyat istihbaratı |
| Ara oynanış | Serbest Devriye Günü | Perşembe gündüz | Oyuncu serbestçe devriye atar, yasal yolun yetmediğini kendisi görür |
| Bölüm 2 / Görev 3 | Kırılma Noktası | Perşembe gece | Ocean Docks baskını, Kartel Teğmeni, rüşvet çantası, `[Y]` / `[N]` kararı |

---

### BÖLÜM 1 / GÖREV 1: RUTİN DEVRİYE VE BAKİYE ŞOKU

#### SAHNE 1: Jefferson — Cross ailesinin evi (Çarşamba 07:30)
**Mekân:** Mutfak ve salon. Masada birikmiş faturalar, All Saints Hastanesi'nin kırmızı ihtarnameleri.
**Karakterler:** Ray, Danny, Sarah.

*(Ray yatak odasından çıkıp mutfağa geçer. Danny masada gevreğini yemektedir.)*

* **Danny:** *"Günaydın baba! Bugün yine kötü adamları mı kovalayacaksın?"*
* **Ray:** *(Oğlunun saçını okşar, hafifçe gülümser)* *"İşimiz bu evlat. Şehri senin için güvenli tutmamız lazım. Okul projen ne durumda?"*
* **Danny:** *"Öğretmenime babamın DEA ajanı olduğunu söyledim. Herkes rozetini görmek istedi! Bir gün beni devriye arabana bindirecek misin?"*
* **Ray:** *"Söz veriyorum, annen iyileşsin, seni tura çıkaracağım."*

*(Salondan şiddetli bir öksürük krizi duyulur. Ray hemen salona geçer. Sarah kanepede oturmuş, mendile öksürmektedir.)*

* **Ray:** *(Yanına diz çöker, bardağa su doldurur)* *"Sarah! İlaçlarını aldın mı? Nefes al, sakin ol..."*
* **Sarah:** *(Bardağı alır, nefesini toplamaya çalışır)* *"İyiyim Ray... Aldım... Sadece ciğerlerim yine sıkıştı. Masadaki mektubu gördün mü?"*
* **Ray:** *(Mutfak masasındaki All Saints General Hospital amblemli zarfı alır)*
* **Sarah:** *"Doktor Evans dün akşam yine aradı. Kitle kemoterapiye hemen başlamazsa yayılacakmış. Sigorta 'deneysel tedavi' deyip ödemiyor. Ön ödeme için $12,500 istiyorlar. Cuma sabah ona kadar yatırmazsak sıramızı başkasına vereceklermiş..."*
* **Ray:** *(Mektubu sıkar, sesini sakin tutmaya çalışır)* *"Merak etme Sarah. Ben bu devletin kanun adamıyım. Rozetime ve işime sadık kaldığım sürece bir yolunu bulacağız. Bürodan avans isteyeceğim, fazla mesai yazdıracağım. O para yatacak."*
* **Sarah:** *(Ray'in elini tutar)* *"Geçen haftaki ilaçlara maaşının yarısı gitti Ray... Kendini tehlikeye atma, ne olursun."*
* **Ray:** *(Rozetini beline, Glock-17'sini kılıfına takar)* *"Her şey düzelecek. Sen dinlen, Danny'yi okula ben bırakırım."*

---

#### SAHNE 2: Pershing Square — LSPD/DEA Ortak Görev Gücü bürosu (08:45)
**Mekân:** Amir Garcia'nın ofisi ve büro içi.
**Karakterler:** Ray, Amir Garcia, Ajan Miller. *(Kısa görünüm: Tenpenny)*

*(Ray büroya girer. Miller elinde kahveyle masaya yaslanmıştır.)*

* **Ajan Miller:** *"Günaydın Ray. Yine yüzünden düşen bin parça. Yenge nasıl?"*
* **Ray:** *"Aynı Miller... Hastane faturaları üstüme geliyor. Amir odasında mı?"*
* **Ajan Miller:** *"İçeride ama dikkat et. Eyalet görev gücünün fonunu kesmiş, sabah sabah küplere bindi."*

*(Tam o sırada koridordan C.R.A.S.H. rozetli iri bir memur geçer. Tenpenny, Ray'e kısa bir bakış atar ve yürümeye devam eder.)*

* **Ajan Miller:** *(Sesini alçaltır)* *"Tenpenny. C.R.A.S.H.'in adamı. Onunla aynı asansöre bile binme."*

*(Ray kapıyı vurup Amir Garcia'nın odasına girer.)*

* **Amir Garcia:** *"Gel Cross, otur. Şehirdeki crack salgını kontrolden çıkmak üzere. Ballas, Idlewood'u ve Jefferson'ı zehire boğuyor, malı da limandan giren bir kartel sağlıyor. Sokaktan kanıt toplamamız, torbacıları temizlememiz lazım."*
* **Ray:** *"Amirim, sözünüzü kesiyorum ama acil bir durumum var. Eşim Sarah'ın akciğer kanseri tedavisi için acilen $12,500 gerekiyor. Bürodan acil sağlık fonu ya da maaş avansı talep edebilir miyim?"*
* **Amir Garcia:** *(Derin bir iç çeker, dosyayı kapatır)* *"Bak Ray... Sen bu bürodaki en dürüst adamsın. Ama eyalet görev gücü fonunu %20 kesti. Bırak avansı, haftalık fazla mesaiyi bile onaylatamıyorum. Yapabileceğim tek şey, dürüstçe getirdiğin her uyuşturucu ve kanıt için yasal prim prosedürünü uygulamak. Paket başına $15–20... Fazlası elimde yok."*
* **Ray:** *(Sessiz kalır, çaresizce başını sallar)* *"Anladım amirim. Devriyeye çıkıyorum."*

---

#### SAHNE 3: Idlewood — Devriye ve ilk sokak müdahalesi (10:15)
**Mekân:** Sivil DEA Premier & Idlewood benzinliğinin arkası.
**Karakterler:** Ray, Miller, siyah ceketli torbacı.

*(Miller direksiyondadır, Ray yolcu koltuğunda dalgın.)*

* **Ajan Miller:** *"Hafta sonu hanımı alıp Las Venturas'a götüreceğim. Küçük bir kumarhane oteli buldum, biraz rulet oynarız diyorduk. Sen ne yapıyorsun?"*
* **Ray:** *(Cebinden deri kaplı defterini [`B`] çıkarıp borç listesine bakar)* *"Evdeyim Miller... Sarah'la ilgileneceğim."*

*(Telsiz cızırdar.)*
* **Telsiz anonsu:** *"Tüm birimler: Idlewood benzinliğinin arkasında uyuşturucu satışı ihbarı. Şüpheli siyah ceketli, mor bandanalı erkek. Yakındaki birimler intikal etsin."*
* **Ajan Miller:** *"1-DEA-CROSS anonsu aldı, olay yerine geçiyoruz."*

*(Araç benzinliğin arkasında durur. Ray iner, torbacıya yaklaşır.)*

* **Ray:** *"DEA! Duvara yaslan, ellerini görebileceğim yere koy!"*
* **Şüpheli:** *"Hey hey! Yanlış adamla uğraşıyorsun ahbap, ben sadece bekliyorum!"*

*(Ray `E`'ye basar, arama animasyonu başlar. **Senaryolu an:** şüpheli Ray'i itip kaçar.)*

* **Şüpheli:** *"Beni asla yakalayamazsın domuz!"* `[AÇIK: v1'deki ırkçı hakaret değiştirildi, bkz. Bölüm 6]`
* **Ray:** *(Arkasından koşarak)* *"Dur! Kaçma!"*
* **Ajan Miller:** *(Kestirmeden önünü keser)* *"Yolun sonu geldi evlat!"*

*(Şüpheli çıkmaz sokağa girer, ellerini kaldırıp diz çöker.)*

* **Şüpheli:** *"Tamam tamam! Vurma! Teslim oluyorum!"*
* **Ray:** *(Kelepçeyi takar)* *"Sessiz kalma hakkın var. Söylediğin her şey aleyhine delil olarak kullanılabilir."*
* **Çıkan kanıt:** 3 crack tüpü, $45 kayıt dışı nakit *(kanıt poşetine girer)*.

*(Ray'in belindeki pager öter.)*
* **Pager:** `ALL SAINTS: SARAH CROSS ODEME YOK. SON GUN CUMA 10:00`

> **Oyun notu:** Bu sahnede ateş etmek orantısız güç kuralını tetikler. Şüpheli silahsızdır; v1'deki *"Dur, yoksa ateş edeceğim!"* repliği oyuncuyu yanlış yönlendirdiği için değiştirildi.

---

#### SAHNE 4: All Saints General Hospital (13:00)
**Mekân:** Hastane girişindeki ATM, Dr. Evans'ın ofisi. `[AÇIK: iç mekân çözümü]`
**Karakterler:** Ray, Dr. Evans.

*(Ray şüpheliyi ve kanıtı büroya teslim etmiş, $45 primi almıştır. Hastane girişindeki ATM'ye kartını sokar.)*

* **ATM ekranı:**
  ```text
  KULLANILABILIR BAKIYE : $495.00
  KRITIK BORC           : -$12,500.00 (ALL SAINTS HOSP.)
  SON ODEME             : CUMA 10:00
  ```

*(Ray yumruğunu ATM'ye hafifçe vurur, Dr. Evans'ın odasına geçer.)*

* **Dr. Evans:** *"Ajan Cross, hoş geldiniz. Sarah'ın son röntgen sonuçları geldi."*
* **Ray:** *"Durumu nasıl doktor?"*
* **Dr. Evans:** *(Filmi ışığa tutar)* *"Açık konuşacağım Ray. Tümör sol akciğerde büyümeye devam ediyor. Cuma sabahına kadar protokole başlamazsak birkaç ay içinde organ yetmezliği başlar. $12,500'ı getirebildiniz mi?"*
* **Ray:** *"Biraz daha zaman verin Doktor... Sadece birkaç gün. Maaşımdan kesilmek üzere senet imzalayayım!"*
* **Dr. Evans:** *"Keşke elimden bir şey gelse Ray... Ama bu protokol ilaç firmasının programı; kontenjan sınırlı ve teminat yatmadığı an sıradaki hastayı almak zorundayım. Cuma sabah on, son gün."*

---

### BÖLÜM 1 / GÖREV 2: SINIRLARIN ZORLANMASI (JEFFERSON MOTEL BASKINI)

#### SAHNE 1: Idlewood ara sokak — Muhbir Slick (14:30)
**Karakterler:** Ray, Slick.

*(Ray hastaneden çıkar. Yasal maaşla bu paranın toplanamayacağını anlamıştır ve daha büyük bir iş arar. Slick'le buluşup cebindeki son harçlıktan $20 uzatır. Bakiye -$20.)*

* **Ray:** *"Slick, hemen teslim edebileceğim bir zula lazım. Büyük küçük fark etmez!"*
* **Slick:** *(Parayı cebine atar, etrafa bakar)* *"Sakin ol Ajan Cross... Jefferson Motel'de, 104 numarada Ballas'ın adamları mal paketliyor. İçeride 2–3 kişi var, hızlı olursan yakalarsın."*
* **Ray:** *(Defterine [`B`] not alır)* *"Sadece 2–3 torbacı mı?"*
* **Slick:** *"Evet adamım, sıradan sokak işi."*

---

#### SAHNE 2: Jefferson Motel — 104 numaralı oda baskını (15:15)
**Karakterler:** Ray, Miller, Şüpheli 1, Şüpheli 2.

*(Ray ve Miller silahlarını çekip kapının önüne gelir.)*

* **Ray:** *"Üç deyince giriyoruz Miller. Bir... İki... Üç!"*
* **Mekanik:** Kapı tekmelenir, içeri girilir (Breach & Clear).
* **Şüpheli 1:** *"Polisler! Vurun şunları!"* *(Ateş açar)*
* **Ajan Miller:** *"Siper al Ray!"* *(Çatışma; Şüpheli 1 etkisiz hale getirilir)*
* **Şüpheli 2:** *"Kahretsin!"* *(Arka pencereden atlayıp kaçar)*
* **Ray:** *"Pencereden kaçtı! Ben peşindeyim Miller, sen odayı emniyete al!"*

*(Kovalamaca. Şüpheli çıkmaz sokakta ellerini kaldırıp diz çöker. Ray `E` ile kelepçeler, araca bindirir.)*

*(Ray odaya döner. Yatağın altında kanıt listesine girmemiş **$100 kayıt dışı nakit** bulur.)*

* **Mikro ahlak testi:**
  * `[A] Parayı cebe at` → +$100, Yozlaşma +2
  * `[B] Kanıt poşetine koy` → Bildirim primi +$15

---

#### SAHNE 3: Büro — Sistem çöküşü (16:30)
**Karakterler:** Ray, Miller.

*(Ray kanıtları ve şüpheliyi teslim eder. Baskın primi: $85. Bakiye: [B] seçildiyse **$575**, [A] seçildiyse **$660**.)*

* **Pager:** `ALL SAINTS: KALAN 41 SAAT. $12,500 ODENMEDI`

*(Ray masasına oturur, başını ellerinin arasına alır. Defterini açıp yazar.)*
* **Defter notu:** *"16:30 — İki operasyon yaptık. Elimde sadece `{BAKIYE}` var. Devletin yasal primleriyle $12,500'ı toplamak imkânsız. Sarah ölüyor. Bir yol bulmam gerek..."*

---

#### SAHNE 4: Operasyon odası — İstihbarat brifingi (17:00)
**Karakterler:** Ray, Miller, telsiz operatörü, Amir Garcia.

*(Ana telsiz cızırdar.)*

* **Telsiz operatörü:** *"Tüm birimlerin dikkatine! İstihbarata göre kartelin büyük sevkiyatı yarın gece Ocean Docks 4. Ambar'a yanaşacak. Konteynerlerde tahminen $500,000 nakit ve uyuşturucu var. Ortak operasyon yarın 22:00'de başlayacak."*
* **Ajan Miller:** *(Heyecanla ayağa kalkar)* *"Ray! Duydun mu? İşte aradığımız fırsat! Yarın gece liman bizim!"*
* **Ray:** *(Kılıfındaki Glock'u yerine oturtur, kendi kendine mırıldanır)* *"$500,000..."*
* **Ajan Miller:** *"Bir şey mi dedin Ray?"*
* **Ray:** *"Yarın gece hazır olalım Miller."*

---

### ARA OYNANIŞ: SERBEST DEVRİYE GÜNÜ (Perşembe 08:00–21:00)

**Amaç:** Oyuncuya yasal yolu kendi eliyle denetmek; hikâyenin "sistem yetmiyor" iddiasını anlatmak yerine oynatmak.

* Oyuncu Idlewood, Ganton, Jefferson ve isterse zengin bölgelerde serbestçe devriye atar.
* Rastgele şüpheliler: üst arama olasılıkları %70 / %20 / %10 (Bölüm 3.4).
* Zengin bölge şikâyet riski ve orantısız güç kuralı bu gün ilk kez gerçek sonuç doğurur.
* Beklenen kazanç: $100–250.
* **18:00 pager:** `ALL SAINTS: KALAN 16 SAAT`
* **İsteğe bağlı telefon görüşmesi:** Danny arar: *"Baba, annem bugün hiç kalkamadı..."*
* **21:00:** Oyun, oyuncuyu operasyon için büroya çağırır.

---

### BÖLÜM 2 / GÖREV 3: KIRILMA NOKTASI (OCEAN DOCKS)

#### SAHNE 1: Ocean Docks'a varış (Perşembe 22:45)
**Mekân:** Liman girişi, şiddetli yağmur ve şimşekler.

*(Araç liman kapısında durur. Silecekler hızla çalışır, gök gürler. Miller ve Ray çelik yeleklerini giyer.)*

* **Ajan Miller:** *"Hava berbat... Ama içerisi kaynıyor Ray. LSPD destek ekipleri arka kapıyı tuttu. İçeride en az 10–12 silahlı adam var deniyor."*
* **Ray:** *(Glock'un şarjörünü kontrol eder, gözleri tek bir noktaya kilitlenmiştir)* *"Destek beklemiyoruz Miller. İçeri giriyoruz."*
* **Ajan Miller:** *"Hey hey, yavaş ol dostum! Bu bir uyuşturucu baskını, intihar görevi değil!"*
* **Ray:** *(Pager'a bakar: `KALAN 11 SAAT`)* *"Benim için intihar görevi Miller. Ya şimdi ya hiç."*

---

#### SAHNE 2: Karanlık konteyner — Rüşvet teklifi (23:20)
**Karakterler:** Ray, Kartel Teğmeni.

*(Ray silahı çekili halde ambarın en arkasındaki karanlık konteynere girer. Köşede yaralı Kartel Teğmeni durmaktadır. Ayağının dibinde deri bir seyahat çantası vardır; arkasındaki paletlerde ise sevkiyatın geri kalanı.)*

* **Ray:** *"Kımıldama! Eller havaya! Bitti!"*
* **Kartel Teğmeni:** *(Acıyla güler, kan tükürür)* *"Bitti mi? Gerçekten bittiğini mi sanıyorsun Ajan Cross?"*
* **Ray:** *"İsmimi nereden biliyorsun?"*
* **Kartel Teğmeni:** *"Seni tanıyoruz Ajan Cross... Jefferson'daki küçük evinde akciğer kanseriyle boğuşan eşin Sarah'ı da, 10 yaşındaki oğlun Danny'yi de..."*
* **Ray:** *(Silahı tutan elleri titrer)* *"Kapa çeneni! Eşimin adını ağzına alma!"*
* **Kartel Teğmeni:** *(Çantanın fermuarını açar; içi $100'lık desteler doludur)* *"All Saints ne kadar istiyordu? $12,500 mü? Bu çantada $50,000 var. Arkamdaki $450,000'ı ortağına bırak, ikiniz de kahraman olun. Kimse eksik elli bini saymaz."*
* **Ray:** *"Anonsta beş yüz bin dendi."*
* **Kartel Teğmeni:** *"O anonsu yapanların yarısı bizim maaş bordromuzda Ajan Cross. Beni kelepçelersen sana verecekleri $150'lık dürüst polis ikramiyesiyle Cuma günü eşinin tabutunu alırsın. Seçim senin..."*

---

### KIRILMA NOKTASI: KADER EKRANI

> Oyun içi metin: ekranda Türkçe karakter kullanılıp kullanılmayacağı `[AÇIK]`. Aşağıdaki metin, karaktersiz (güvenli) sürümdür.

```text
===================================================================================
                        KIRILMA NOKTASI: KADERINI SEC
===================================================================================

 [Y] YOZLASMIS YOL (KARA PARA VE HAYAT)
 ----------------------------------------------------------------------------------
  - $50,000'lik cantayi al. Tegmenin kacmasina goz yum.
  - Sarah'in $12,500'lik kemoterapi on odemesini yap, hayatini kurtar.
  - Miller'a ve buroya yalan soyle.
  - SONUC: Yozlasma en az 50'ye cikar. Kayip $50,000 Ic Isleri'nin
    dikkatini ceker; seni "koruyan" Tenpenny olur ve onun piyonu olursun.
    Para aklama (VHS dukkani) mekanikleri acilir.

 [N] TEMIZ YOL - ZOR MOD (ONUR VE INTIKAM)
 ----------------------------------------------------------------------------------
  - Rusveti reddet. Tegmeni kelepcele ya da vur.
  - $500,000'in tamamini buroya teslim et (yasal prim: $150).
  - Cuma 10:00'da odeme yapilamaz. [ACIK: Sarah'in kaderi]
  - SONUC: Durust kalirsin ama ruhen olursun. Polis destegi kesilir.
    Sogukkanli, intikam odakli bir infazciya donusursun (Zor Mod).
===================================================================================
```

**Kararın sistemdeki karşılıkları:**
* Teğmen yaralı ve silahsızdır; **N yolunda onu vurmak orantısız güç kuralını tetikler** (Yozlaşma +5, İç İşleri). "Temiz" yolun içinde bile küçük bir gri seçim olur.
* **Y yolunda** raporda $450,000 yazar, anons $500,000 demişti. Bu fark Bölüm 3'ün açılış çatışmasıdır.
* **N yolunda "polis desteği kesilir" gerekçesi (öneri):** Teğmen bağlantıları sayesinde 48 saat içinde serbest bırakılır; Ray rozetini masaya bırakıp kanun dışı intikama başlar. `[AÇIK]`

---

## 6. AÇIK KARARLAR

| # | Konu | Seçenekler | Öneri |
|---|---|---|---|
| 1 | **N yolunda Sarah'ın kaderi** | (a) v1'deki gibi ölür (b) Pahalı alternatif bir kurtuluş yolu var (tefeci, Miller'ın bağış kampanyası...) | Tema kararı, senin |
| 2 | **Oyun içi Türkçe karakterler** | (a) Türkçe font yaması (b) Karaktersiz Türkçe ("YOZLASMIS") (c) İngilizce metin | Faz 1'de (a) test edilsin, olmazsa (b) |
| 3 | **Ray'in etnik kökeni** ve Sahne 3'teki hakaret | (a) Belirle ve hakareti hikâyeye bağla (1992 LA, Rodney King dönemi) (b) Nötr bırak, "domuz" kalsın | Senin |
| 4 | **Hastane iç mekânı** | (a) Dış çekim + telefon görüşmesi (b) Başka bir iç mekânı ofis gibi kullan (c) Özel iç mekân modelle | Başlangıçta (a), sonra (b) |
| 5 | **Oyuncu karakteri** | (a) CJ'in görünümünü Ray modeliyle değiştir (b) Ray ayrı bir karakter olarak | Faz 0'da araştırılacak |
| 6 | **CJ'in görevleriyle çakışma** | CLEO ile orijinal hikâyenin görev işaretleri haritada kalır | Faz 0'da araştırılacak; gerekirse ileride `main.scm` yoluna geçilir |
| 7 | **Kartel Teğmeni'ne isim** | — | İsteğe bağlı |

---

## 7. DEĞİŞİKLİK KAYDI (v1 → v2)

| Alan | v1 | v2 | Neden |
|---|---|---|---|
| Ev | Commerce | Jefferson | Commerce iş bölgesi; Jefferson motel, hastane ve Idlewood'a yakın |
| Motel | Garcia Motel | Jefferson Motel | Garcia San Fierro'da; ayrıca Amir Garcia ile isim karışıyordu |
| Çete | Barksdale (The Wire) | Ballas | SA kanonu, Idlewood zaten Ballas bölgesi |
| Kartel | San Fierro Karteli | Loco Syndicate'in tedarikçi karteli | Kanonla bağ: Ballas–Loco Syndicate–Tenpenny crack zinciri |
| Banka | Fleeca (GTA V) | Adsız banka ATM'si | SA'da Fleeca yok |
| Şüpheli adı | "BMYDRUG" | "siyah ceketli, mor bandanalı erkek" | BMYDRUG model dosyası adı, oyun içi metin değil |
| Bütçe | Belediye (Miller) / Eyalet Senatosu DEA bütçesi (Garcia) | Eyalet, görev gücü fonunu kesti (ikisi de) | Çelişki vardı; DEA federal, eyalet bütçesini kesemez |
| Sigorta | Anılmıyordu | Federal sigorta deneysel protokolü reddetti | "DEA ajanının sigortası yok mu?" boşluğu |
| Son gün | "3 gün" / "Cuma" / 48→36→24 saat (aynı gün içinde) | Tek son gün: **Cuma 10:00**, pager süreleri gerçek saatten hesaplanıyor | 6 saatte 12 saat düşüyordu |
| Ocean Docks | Aynı akşam 22:45 | **Perşembe** gecesi; araya Serbest Devriye Günü eklendi | Zaman tutarlılığı + yasal yolun yetmediğini oyuncu kendisi görüyor |
| Bakiye | $575 (hesap $555 çıkıyordu) | Baskın primi $85 + bildirim primi $15 = $575; [A] seçilirse $660, defter değişkenden okuyor | Hesap hatası; seçimin sonucu yok sayılıyordu |
| Maaş | Haftalık $1,200 "taksitli" | Haftalık net $950, Pazartesi yatar | "Taksitli" belirsizdi; maaşın ipotek+faturayı bile karşılamaması gerilimi artırıyor |
| Ahlak | Şeref Puanı + Yozlaşma karışık | Tek değişken `YOZLASMA` (0–100), Şeref = 100 − Yozlaşma | İki değişken tutarsızdı |
| Kader Y sonucu | "Ahlak puanın sıfırlanır" | Yozlaşma en az 50 | Kademeli yozlaşma daha oynanabilir |
| Rüşvet | $500,000'in tamamı | $50,000 çanta, $450,000 teslim | Kartelin tüm sevkiyatı vermesi inandırıcı değildi; eksik para Bölüm 3'e kanca oluyor |
| Tenpenny | Sadece kader ekranında | Bölüm 1'de kısa görünüm + Teğmen'in "bordro" iması | Hiç tanıtılmadan çıkıyordu |
| Kader ekranı | "Ameliyat faturası" | "Kemoterapi ön ödemesi" | Tedavi kemoterapi |
| Defter tuşu | N | B (geçici) | N, SA'nın "Hayır" tuşu ve kader ekranı da N kullanıyor |
| Telefon | Arama + SMS | Sadece arama; mesajlar pager'da | 1992'de tüketici SMS'i yoktu |
| Diyalog | "Sarah annen", "Danny'ye mukayyet ol", "Dur yoksa ateş edeceğim" | "annen", "Danny'yi okula ben bırakırım", "Dur! Kaçma!" | Doğal olmayan / mekanikle çelişen replikler |
| Yazım | "B Barksdale", "Aklana" | Düzeltildi | — |
