# NewsPaper

NewsPaper, haber başlıklarını gösteren basit bir iOS uygulamasıdır. Bu uygulama, bir haber API'sı kullanarak güncel ve Türkçe haber başlıklarını kullanıcılara sunar.

## Özellikler

- Kullanıcılara güncel ve Türkçe haber başlıklarını sunar.
- Haber başlıklarını tıklayarak ilgili haberin internet sitesine yönlendirir.
- Basit ve kullanıcı dostu arayüzüyle hızlı ve kolay kullanım sağlar.

## Başlarken

Bu projeyi yerel bir ortamda çalıştırmak için şu adımları izleyin:

1. Projeyi bilgisayarınıza klonlayın:
   ```bash
   git clone https://github.com/TypeCc/NewsPaper.git
2. Proje dizinine gidin:
   ```bash
   cd NewsPaper
3. Projeyi Xcode ile açın:
   ```bash
   NewsPaper.xcodeproj
4. Projeyi Xcode'da çalıştırın.

## Kullanım

1. Uygulamayı başlatın ve ana ekranda mevcut haber başlıklarını görün.
2. İlgilendiğiniz bir haber başlığına tıklayarak ilgili haberin internet sitesine gidin.
3. Ana ekranda bulunan "Güncelle" butonuna tıklayarak haber başlıklarını yenileyin.

## API Kullanımı

NewsPaper uygulaması, [News API](https://newsapi.org/) tarafından sağlanan bir API kullanır. API, dünya genelindeki çeşitli haber kaynaklarından haber başlıklarını sağlar ve JSON formatında erişilebilir.

## Katkıda Bulunma

- Eğer bir hata bulursanız veya bir öneriniz varsa lütfen [sorun bildirin](https://github.com/TypeCc/NewsPaper/issues).
- Projeye katkıda bulunmak isterseniz lütfen bir [çekme isteği](https://github.com/TypeCc/NewsPaper/pulls) gönderin.

# News API Kullanımı

Bu Swift dosyası, News API kullanımını kolaylaştırmak için tasarlanmıştır. Bu API, haber başlıklarını ve içeriklerini sağlar.

## API Endpoints

### Base URL

Base URL, haber başlıklarını çekmek için kullanılır.

- **URL**: https://newsapi.org/v2/top-headlines
- **Query Parametreleri**:
  - `country=tr`: Türkiye haberlerini almak için.
  - `category=business`: İş haberlerini almak için.
  - `apiKey=[API_KEY]`: API anahtarı.

### API Key

API anahtarı, News API'ye erişmek için kullanılır.

- **API Key**: 0bbd4b4f5c854c48b3d79e0075424ed8

## Kullanım

API.swift dosyasını projenize dahil edin ve News API'yi kullanmak için `endpoint()` fonksiyonunu çağırın. Bu fonksiyon, haber başlıklarını çekmek için tam bir URL döndürecektir.

Örnek Kullanım:

```swift
let url = API.endpoint()
print("API Endpoint:", url)

