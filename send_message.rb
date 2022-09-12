require 'net/http'

params = { token: ARGV[0], room_id: ARGV[1], message: ARGV[2][1, ARGV[2].length - 2] }

uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/messages")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

body = "body=#{params[:message]}"
headers = { "X-ChatWorkToken" => "#{params[:token]}" }

response = http.post(uri.path, body, headers)

puts response.code
puts response.body
