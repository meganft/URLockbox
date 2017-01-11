class HotReadsService
  def self.post_link(link)
    conn = Faraday.new(url: "http://localhost:2000")
    conn.post '/api/v1/hotreads', {link: link}
  end
end
