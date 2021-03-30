# frozen_string_literal: true

require_relative 'pokepaste/tokens'
require_relative 'pokepaste/data'

module Rouge
  module Lexers
    class Pokepaste < RegexLexer
      title 'Pokepaste'
      desc 'The syntax used by Pokemon Showdown, PokePaste, PKHex, and other tools to represent Pokemon teams'
      tag 'pokepaste'
      aliases 'pokemon', 'showdown', 'pkhex'

      state :root do
        mon = /[A-Z][a-z0-9:']+\.?(?:[- ][A-Za-z][a-z0-9:']*\.?)*/
          
        rule %r/ +\n/, Text
        rule %r/(?:(?<pre>.* \()(?<mon1>#{mon})(?<post>\))|(?<mon2>#{mon}))/ do |m|
          if m[:mon1]
            token Text, m[:pre]
            token Types::Pokemon[m[:mon1]], m[:mon1]
            token Text, m[:post]
          else
            token Types::Pokemon[m[:mon2]], m[:mon2]
          end
          push :head
        end
      end

      state :head do
        rule %r/( \()([MF])(\))/ do |m|
          groups Text, m[2] == "M" ? Pokemon::Gender::M : Pokemon::Gender::F, Text
        end
        rule %r/( @ )([A-Z][a-z0-9:']*(?:[- ][A-Z][a-z0-9:']*)*)/ do |m|
          groups Text, Types::Item[m[2]]
        end
        rule %r/ +/, Text
        rule %r/\n/ do
          token Text
          goto :body
        end
      end

      state :body do
        rule %r/ *\n/, Text, :pop!
        rule %r/.*?:/ do |m|
          token Keyword
          push /\A[DEI]Vs:/ =~ m[0] ? :stats : :text
        end
        rule %r((-)( )([^ \n/][^\n/]+[^ \n/])) do |m|
          groups Types::Move[m[3]], Text, Text
          push :text
        end
        rule %r/.*\n/, Text
      end

      state :stats do
        rule %r/\n/, Text, :pop!
        rule %r/\d+ ([A-Za-z]+)/ do |m|
          token Stats::Stat[m[1]]
        end
        rule %r([ /]+), Text
      end

      state :text do
        rule %r/.*\n/, Text, :pop!
      end
    end
  end
end
