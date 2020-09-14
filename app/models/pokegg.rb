class Pokegg < ApplicationRecord
  belongs_to :user
  monetize :price_cents
  has_many :orders, dependent: :destroy
  has_one_attached :photo
  validates :name, inclusion: {in: %w(Name Bulbizarre Salamèche Carapuce Chenipan Aspicot Roucool Rattata Piafabec Abo Pikachu Sabelette Nidoran Goupix Nosferapti Mystherbe Paras Mimitoss Taupiqueur Miaouss Psykokwak Férosinge Caninos Ptitard Abra Machoc Chétiflor Tentacool Racaillou Ponyta Ramoloss Magnéti Canarticho Doduo Otaria Tadmorv Kokiyas Fantominus Onix Soporifik Krabby Voltorbe Nœunœuf Osselait Excelangue Smogo Rhinocorne Saquedeneu Kangourex Hypotrempe Poissirène Stari Insécateur Scarabrute Tauros Magicarpe Lokhlass Métamorph Évoli Porygon Artikodin Électhor Sulfura Minidraco Mewtwo Mew Germignon Héricendre Kaiminus Fouinette Hoothoot Coxy Mimigal Loupio Pichu Mélo Toudoudou Togepi Natu Wattouat Granivol Capumain
Tournegrin Yanma Axoloto Cornèbre Feuforêve Zarbi Girafarig Pomdepik Insolourdo Scorplane Snubbull Qwilfish Caratroc Scarhino Farfuret Teddiursa Limagma Marcacrin Corayon Rémoraid Cadoizo Airmure Malosse Phanpy Cerfrousse Queulorior Debugant Kapoera Lippouti Élekid Magby Écrémeuh Raikou Entei Suicune Embrylex Lugia Ho-Oh Celebi
Arcko Poussifeu Gobou Medhyèna Zigzaton Chenipotte Nénupiot Grainipiot Nirondelle Goélise Tarsal Arakdo Balignon Parécool Ningale Chuchmur Makuhita Azurill Tarinor Skitty Ténéfix Méditikka Dynavolt Posipi Négapi Muciole Lumivole Gloupti Carvanha Wailmer Chamallot Chartor Spoink Spinda Kraknoix Cacnea Tylton Mangriff Séviper Séléroc Solaroc Barloche Écrapince Balbuto Barpau Morphéo Kecleon Polichombr Skelénox Tropius Absol Okéoké Stalgamin Obalie Coquiperl Relicanth Lovdisc Draby Terhal Regirock Regice Registeel Latias Latios Kyogre Groudon Rayquaza Jirachi Deoxys
Tortipouss Ouisticram Tiplouf Etourmi Keunotor Crikzik Lixy Rozbouton Cheniti Apitrini Pachirisu Mustébouée Ceribou Sancoki Baudrive Laporeille Chaglam Korillon Moufouette Archéomire Manzaï Mime Jr. Ptiravi Pijako Spiritomb Griknot Goinfrex Riolu Hippopotas Rapion Cradopaud Vortente Écayon Babimanta Blizzi Motisma Créhelf Créfollet Créfadet Dialga Palkia Heatran Regigigas Giratina Cresselia Phione Manaphy Darkrai Shaymin Arceus),
message: "%{value} is not a valid name"
}
validates :category, inclusion: {in: %w(Feu Eau Plante Insecte Electricité Roche Sol Dragon Fée Ténèbre Spectre Psy Normal Combat Glace Poison Vol Acier),
  message: "%{value} is not a valid type"
}
validates :region, inclusion: {in: %w(Kanto Johto Hoenne Sinnoh),
  message: "%{value} is not a valid region"
}

validate :birthday_before_today

private

def birthday_before_today
  if birthday < Date.today
      errors.add(:birthday, "can't be before today")
  end
end

end
