require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Word.blueprint do
  word {"makkelijk"}
end

Meaning.blueprint do
  text {"niet moeilijk, waar weinig moeite en inspanning voor vereist is"}
  word
end

Example.blueprint do
  text {"Het was so makkie"}
  meaning
end
