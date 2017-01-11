class HotReadsService
  def self.post_link(link)
    conn = Faraday.new(url: "https://sheltered-ocean-18171.herokuapp.com")
    conn.post '/api/v1/hotreads', {link: link}
  end
end
