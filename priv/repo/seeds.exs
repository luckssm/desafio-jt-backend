# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Backend.Repo.insert!(%Backend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Backend.Repo.insert!(%Backend.User{name: "João", email: "joao@email.com"})

Backend.Repo.insert!(%Backend.City{name: "Orlando", location: "Flórida"})
Backend.Repo.insert!(%Backend.City{name: "Tenerife", location: "Espanha"})
Backend.Repo.insert!(%Backend.City{name: "Penha", location: "Santa Catarina"})
Backend.Repo.insert!(%Backend.City{name: "Aquiraz", location: "Ceará"})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "Magic Kingdom",
  perks: "airline-ticket",
  details:
    "O Magic Kingdom Park, da Disney, localizado na Flórida, proporciona para seus visitantes atrações clássicas, fogos de artifício, desfiles musicais e os personagens Disney em 6 terras fantásticas."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "Epcot",
  perks: "wi-fi",
  details:
    "O parque Disney Epcot também faz parte do complexo Walt Disney World Resort em Orlando e foi a segunda área aberta para o público do complexo, depois do Magic Kingdom. Como o nome já fala (Experimental Prototype Community Of Tomorrow), o Epcot é considerado o parque do futuro da Disney, já que diversos atrativos contam com muita tecnologia. Até o momento, o Epcot é dividido em duas grandes regiões: a Future World, que concentra a maior parte das atrações do parque, com brinquedos tecnológicos; e a World Showcase, uma área temática de 11 países ao redor do mundo, como Marrocos, México, Alemanha, China e outros."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "Hollywood Studios",
  perks: "wi-fi",
  details:
    "Outro parque imperdível em Orlando, e que remete ao mundo dos filmes, é o Disney Hollywood Studios. Ele faz parte do complexo Walt Disney World Resort e é onde você tem a oportunidade de tirar fotos com personagens famosos como a Bela e a Fera, Star Wars e com os brinquedos de Toy Story. O interessante deste parque é a sua temática do mundo do cinema: suas várias atrações remetem aos mais conhecidos filmes da Disney. Lá estão áreas exclusivas de grandes sucessos da Disney, como Toy Story e Star Wars, que são muito procuradas pelos visitantes."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "Animal Kingdom",
  perks: "wi-fi",
  details:
    "O parque Disney Animal Kingdom remete ao mundo dos animais. Além de ser um dos parques mais famosos de Orlando, ele é o maior dentro do complexo do Walt Disney World Resort e também da cidade. A ideia do Animal Kingdom é bastante interessante, já que foi montada toda uma estrutura para que os visitantes possam explorar o mundo animal. O símbolo desse parque é a grande Árvore da Vida, que pode ser vista de quase todas as áreas do local. Ela conta com mais de 300 animais esculpidos no seu tronco e galhos."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "Universal Studios",
  perks: "breakfast",
  details:
    "Outro parque incrível que está na lista dos melhores para visitar na cidade é o Universal Studios Orlando, considerado o segundo melhor parque temático de Orlando e um dos mais visitados de todo o mundo. O Universal Studios é um parque temático de diversos filmes e séries, como Homens de Preto, Transformers, Velozes e Furiosos, Shrek e até mesmo Harry Potter. Sim, o bruxo mais famoso do mundo tem uma área destinada apenas para ele, chamada Beco Diagonal."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "Islands of Adventure",
  perks: "room",
  details:
    "O parque Islands of Adventure também faz parte do complexo Universal Orlando Resort e está recheado de atrações legais e radicais. Atualmente, ele é uma das áreas mais visitadas de Orlando por conta das atrações voltadas ao mundo do Harry Potter, que, desde meados de 2010, fazem com que o parque tenha filas enormes e uma grande procura. A área dedicada ao bruxo é chamada de Hogsmeade, e abriga o Castelo de Hogwarts."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "SeaWorld",
  perks: "breakfast",
  details:
    "O parque SeaWorld Orlando é o maior parque de atrações marinhas da Flórida e do mundo. O SeaWorld é espetacular e existe desde 1973, tendo como foco a interação dos visitantes com os animais marinhos e os incríveis shows e espetáculos. Os animais que você vai encontrar nesse parque aquático são golfinhos, peixes de todos os tipos e espécies, leões marinhos, focas e até tubarões. Há diversas atrações, shows e até mesmo montanhas-russas."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "NASA Kennedy Space Centers",
  perks: "room",
  details:
    "O Kennedy Space Center é um grande centro espacial da NASA, que inclui uma área fantástica aberta ao público. Ele está localizado na ilha Cabo Canaveral, a cerca de 72 km de Orlando, e é um local imperdível para visitar durante a sua viagem. O NASA Kennedy Space Center é o ponto de lançamento de foguetes, ônibus espaciais e até mesmo satélites, e recebe diversos visitantes diariamente, que desejam se divertir e conhecer mais sobre o trabalho dos astronautas."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 1,
  name: "Blizzard Beach",
  perks: "airline-ticket",
  details:
    "O parque Blizzard Beach em Orlando é um dos dois parques aquáticos da Disney e conta com uma temática peculiar, remetendo ao Pólo Norte. A decoração é belíssima, com montanhas cobertas de neve, chalés de madeira no estilo de uma estação de esqui e muito mais. Dentro desse parque, você encontra vários lugares para nadar, piscina de ondas, toboáguas distintos, correnteza etc."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 2,
  name: "Siam Park",
  perks: "wi-fi",
  details:
    "O melhor parque aquático do mundo é o Siam Park, em Tenerife, na Espanha, que já tinha sido o número 1 no ranking de 2022. Nele, os aventureiros irão encontrar desde rios sinuosos a tobogã em queda livre, tudo com uma arquitetura tailandesa."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 3,
  name: "Beto Carrero World",
  perks: "wi-fi",
  details:
    "Com cinema 3D, apresentações teatrais e brinquedos radicais, o Beto Carrero World, em Penha, Santa Catarina, fica com o segundo lugar do ranking. O parque também foi reconhecido como o mais visitado da América Latina, com mais de 2,3 milhões de clientes e o único a superar os números de visitação pré-pandemia, aponta relatório da Themed Entertainment Association (TEA)."
})

Backend.Repo.insert!(%Backend.Ticket{
  city_id: 4,
  name: "Beach Park",
  perks: "wi-fi",
  details:
    "O maior parque aquático do Brasil, o Beach Park, em Aquiraz, no Ceará, tem piscinas, corredeiras artificiais e, para os mais radicais, um toboágua com altura de 14 andares."
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 1,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 1,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 2,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 2,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 3,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 3,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 4,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 4,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 5,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 5,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 6,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 6,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 7,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 7,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 8,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 8,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 9,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 9,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 10,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 10,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 11,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 11,
  value: 21000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Adult",
  ticket_id: 12,
  value: 24000
})

Backend.Repo.insert!(%Backend.TicketValue{
  day: "2023-10-08",
  type: "Child",
  ticket_id: 12,
  value: 21000
})
