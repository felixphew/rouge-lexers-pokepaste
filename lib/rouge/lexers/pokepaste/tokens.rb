# frozen_string_literal: true

module Rouge
  class Token
    module Tokens
      token :Pokemon, ''  do
        token :Type, 'type' do
          token :Normal, 'type-normal'
          token :Fighting, 'type-fighting'
          token :Flying, 'type-flying'
          token :Poison, 'type-poison'
          token :Ground, 'type-ground'
          token :Rock, 'type-rock'
          token :Bug, 'type-bug'
          token :Ghost, 'type-ghost'
          token :Steel, 'type-steel'
          token :Fire, 'type-fire'
          token :Water, 'type-water'
          token :Grass, 'type-grass'
          token :Electric, 'type-electric'
          token :Psychic, 'type-psychic'
          token :Ice, 'type-ice'
          token :Dragon, 'type-dragon'
          token :Dark, 'type-dark'
          token :Fairy, 'type-fairy'
        end
        token :Gender, 'gender' do
          token :M, 'gender-m'
          token :F, 'gender-f'
        end
        token :Stat, 'stat' do
          token :HP, 'stat-hp'
          token :Atk, 'stat-atk'
          token :Def, 'stat-def'
          token :Spc, 'stat-spc'
          token :SpA, 'stat-spa'
          token :SpD, 'stat-spd'
          token :Spe, 'stat-spe'
        end
      end
    end
  end
end
