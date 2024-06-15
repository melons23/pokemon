class ZukansController < ApplicationController
    def index
      pokemons = []# ポケモンの名前を格納する空の配列を作成
  
      response = Faraday.get "https://pokeapi.co/api/v2/pokemon-species?limit=151&offset=0"
      #↑ pokeAPIからno.001からno.151までを取得（GET）する
      response = JSON.parse(response.body)
      # JSON.parseとはJSON形式の文字列をRubyのHash（ハッシュ）形式に変換するためのメソッド
      response.each do |k, value|
        if k == "results"
          value.each do |key, val|
            response = Faraday.get(key["url"])
            response = JSON.parse(response.body)
            pokemons.push(response)
          end
        end
      end
      
      pokemons.map do |poke|
        unless Zukan.exists?(id: poke['id'])
          Zukan.create(
            id: poke['id'],
            name: poke['names'][0]['name']
          )
        end
      end
      @pokemons = Zukan.all
  end
end
