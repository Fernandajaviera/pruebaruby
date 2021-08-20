require "uri"
require "net/http"
require "json"

def request(url, api_key)
    uri = URI(url + "&api_key=" + api_key)
    res = Net::HTTP.get_response(uri)
    return JSON.parse(res.body)
end

def buid_web_page(hash)
    html = "<html>\n<head>\n</head>\n<body>\n<ul>\n"
    hash["photos"].each do |x|
        html = html + "    <li><img src='" + x["img_src"] + "'></li>\n"
    end
    html = html + "</ul>\n</body>\n</html>\n"
    return html
end

a = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10", "QpyPuHHByypfJOx7hJRznlcEKIgtBb4SvG0J5TQs")
codigo_html = buid_web_page(a)
File.write('resultados.html', codigo_html)