class WordScraper
  URL = "http://nl.wiktionary.org/wiki"

  def initialize(word)
    @word  = word
    @agent = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}
    scrape
  end
  def scrape
    @page = @agent.get("#{URL}/#{@word}")
  end
  def means
    @page.search("ol li").text
  end
end
