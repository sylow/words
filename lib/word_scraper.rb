class WordScraper
  URL = "http://nl.wiktionary.org/wiki"
  attr_accessor :meanings 
  def initialize(word)
    @meanings = Array.new
    agent = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}
    @page = agent.get("#{URL}/#{word}")
    scrape
  end
  def scrape
    @page.search("ol li").each do |result|
      meaning = Hash.new
      meaning[:meaning] = result.children.first.text.chomp
      examples = Array.new
      result.search("dl").children.each do |example|
        examples << example.text.chomp unless example.text.chomp.blank?
      end
      meaning[:examples] = examples#.compact!
      @meanings << meaning
    end
  end
end

#{:meaning => "xxxx",
# :examples => [".....","......"]}
