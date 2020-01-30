# TODO: Write documentation for `Get::Youtube::Id`
module Iom::GetYoutubeId
  VERSION = "0.1.0"

  @@pattern = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/

  def self.get_youtube_id (haystack : String?) : String | Nil
    return nil if haystack.nil?
    md = haystack.match @@pattern
    if md && md.captures.any?
      return md.captures[0]
    end
    nil
  end

  def self.get_youtube_ids (haystack : String?) : Set(String)
    values = Set(String).new
    return values if haystack.nil?
    haystack.scan(@@pattern).flatten.each do |md|
      md.captures.each do |needle|
        values.add needle unless needle.nil?
      end
    end
    return values
  end
end
