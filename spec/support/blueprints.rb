require 'machinist/active_record'
Word.blueprint do
  text {"makkelijk"}
end

Meaning.blueprint do
  text {"niet moeilijk, waar weinig moeite en inspanning voor vereist is"}
  word
end

Example.blueprint do
  text {"Het was so makkie"}
  meaning
end

["makkelijk", "misschien", "aankomen"].each do |word|
  FakeWeb.register_uri(:get, "http://nl.wiktionary.org/wiki/#{word}", :response => File.read("#{::Rails.root.to_s}/spec/files/#{word}.response"))
end
