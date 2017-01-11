require "./app/services/hotreadsservice.rb"

class Read < ApplicationRecord
  belongs_to :link

  def self.create_hotreads(link)
    HotReadsService.post_link(title: link.title, url: link.url)
  end
end
