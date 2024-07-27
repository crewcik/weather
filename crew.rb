require 'open-uri'
require 'json'

def hava_durumu_getir(sehir)
  api_key = 'API_ANAHTARINIZ' # Buraya api anahtarını girin ve yazılımı çalıştırın. İyi kodlamalar.
  base_url = "http://api.openweathermap.org/data/2.5/weather?q=#{sehir}&appid=#{api_key}&units=metric"

  begin
    response = URI.open(base_url).read
    hava_verisi = JSON.parse(response)

    if hava_verisi['cod'] == 200
      sicaklik = hava_verisi['main']['temp']
      aciklama = hava_verisi['weather'][0]['description']
      puts "#{sehir.capitalize} şehrindeki güncel sıcaklık #{sicaklik}°C ve hava durumu: #{aciklama}."
    else
      puts "#{sehir} için hava durumu bilgisi alınamadı. Lütfen şehir adını kontrol edin."
    end
  rescue OpenURI::HTTPError => e
    puts "Bir hata oluştu: #{e.message}"
  end
end

puts "Şehir Girin:"
sehir = gets.chomp
hava_durumu_getir(sehir)

# Bu kod Crew.dev tarafından kodlandı.
# Çalıştırmak için ' ruby crew.rb ' yazabilirsiniz.
