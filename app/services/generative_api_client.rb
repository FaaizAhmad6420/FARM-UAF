# app/services/generative_api_client.rb
require 'net/http'
require 'json'

class GenerativeApiClient
  def generate_content(api_key, prompt)
    uri = URI("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=#{api_key}")
    headers = { 'Content-Type': 'application/json' }
    body = {
      contents: [
        {
          parts: [{ text: prompt }]
        }
      ]
    }.to_json

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path + "?" + uri.query, headers)
    request.body = body
    response = http.request(request)

    parsed_response = JSON.parse(response.body)
    # Return the response with a safeguard for missing 'candidates'
    parsed_response.fetch('candidates', [])
  rescue StandardError => e
    Rails.logger.error("API Request Failed: #{e.message}")
    { 'error' => e.message }
  end
end
