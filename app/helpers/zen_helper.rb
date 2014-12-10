module ZenHelper
  def get_quote
    response = HTTParty.get('https://api.github.com/zen', basic_auth: { username: ENV['GITHUB_USERNAME'], password: ENV['GITHUB_PASSWORD']})
    if response.code == 401
      "you need authorization fool"
    elsif response.header["X-RateLimit-Remaining"] == 0
      "go get a life"
    else
      response + " | remaining requests: " + response.header["X-RateLimit-Remaining"]
    end
  end
end
