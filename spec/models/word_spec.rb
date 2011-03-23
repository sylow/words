require 'spec_helper'

describe Word do
  context "with one meaning" do
    it "save even without a meaning" do
      word = Word.make
      word.should be_valid
    end
  end
end

describe WordScraper do
  context "defines simple word with one meaning and no example" do
    it "having only one meaning" do
      scrape = WordScraper.new("makkelijk")
      meanings = scrape.meanings.collect{|w| w[:meaning]}
      meanings.should include("niet moeilijk, waar weinig moeite en inspanning voor vereist is")
    end
  end
  context "with more than one meaning" do
    it "having simple meaning with no example sentence" do
      scrape = WordScraper.new("aankomen")
      meanings = scrape.meanings.collect{|w| w[:meaning]}
      meanings.should include("even bezoeken")
    end

    it "having a meaning without an example" do
      scrape = WordScraper.new("aankomen")
      meanings = scrape.meanings.collect{|w| w[:meaning]}
      meanings.should include("een bestemming bereiken")
    end
    it "having a meaning with an example" do
      scrape = WordScraper.new("aankomen")
      examples = scrape.meanings.collect{|w| w[:examples]}.flatten
      examples.should include("U bent aangekomen in Overveen.")
    end
  end
end
