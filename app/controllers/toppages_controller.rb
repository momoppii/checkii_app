class ToppagesController < ApplicationController
  def index
    
    require 'net/http'
    url = "https://opendata.corona.go.jp/api/Covid19JapanAll"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    kannsennsyasuu = JSON.parse(response)
    hash = kannsennsyasuu.find {|k,v| k == "itemList"}
    array = hash.last
    patients = array.first(47)
    @zennkokudata = [[patients[0].values[1], patients[0].values[2]], [patients[1].values[1], patients[1].values[2]], [patients[3].values[1], patients[3].values[2]], [patients[4].values[1], patients[4].values[2]], [patients[5].values[1], patients[5].values[2]], [patients[6].values[1], patients[6].values[2]], [patients[7].values[1], patients[7].values[2]], [patients[8].values[1], patients[8].values[2]], [patients[9].values[1], patients[9].values[2]], [patients[10].values[1], patients[10].values[2]], [patients[11].values[1], patients[11].values[2]], [patients[12].values[1], patients[12].values[2]], [patients[13].values[1], patients[13].values[2]], [patients[14].values[1], patients[14].values[2]], [patients[15].values[1], patients[15].values[2]], [patients[16].values[1], patients[16].values[2]], [patients[17].values[1], patients[17].values[2]], [patients[18].values[1], patients[18].values[2]], [patients[19].values[1], patients[19].values[2]], [patients[20].values[1], patients[20].values[2]], [patients[21].values[1], patients[21].values[2]], [patients[22].values[1], patients[22].values[2]], [patients[23].values[1], patients[23].values[2]], [patients[24].values[1], patients[24].values[2]], [patients[25].values[1], patients[25].values[2]], [patients[26].values[1], patients[26].values[2]], [patients[27].values[1], patients[27].values[2]], [patients[28].values[1], patients[28].values[2]], [patients[29].values[1], patients[29].values[2]], [patients[30].values[1], patients[30].values[2]], [patients[31].values[1], patients[31].values[2]], [patients[32].values[1], patients[32].values[2]], [patients[33].values[1], patients[33].values[2]], [patients[34].values[1], patients[34].values[2]], [patients[35].values[1], patients[35].values[2]], [patients[36].values[1], patients[36].values[2]], [patients[37].values[1], patients[37].values[2]], [patients[38].values[1], patients[38].values[2]], [patients[39].values[1], patients[39].values[2]], [patients[40].values[1], patients[40].values[2]], [patients[41].values[1], patients[41].values[2]], [patients[42].values[1], patients[42].values[2]], [patients[43].values[1], patients[43].values[2]], [patients[44].values[1], patients[44].values[2]], [patients[45].values[1], patients[45].values[2]], [patients[46].values[1], patients[46].values[2]]]
  end
end
