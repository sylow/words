require 'spec_helper'

describe Word do
  it "should save even without a meaning" do
    word = Word.make
    word.should be_valid
  end
  it "should have a blabla as description if asked for" do
    word = Word.make
    word.description.should be_nil
  end
  it "should return easy when I scrape" do
    @scrape = WordScraper.new("makkelijk")
    @scrape.means.should == "niet moeilijk, waar weinig moeite en inspanning voor vereist is"
  end
end
