namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco de dados...") { %x(rails db:drop) }
      show_spinner("Criando o banco de dados...") { %x(rails db:create) }
      show_spinner("Migrando o banco de dados...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types) # Primeiro cadastra os tipos de moedas
      %x(rails dev:add_coins)
    else 
      puts "Você não está em ambiente de desenvolvimento."
    end
  end

  desc "Cadastrando Moedas..."
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas...") do 
      coins = [
          {
              description: 'Bitcoin',
              acronym: 'BTC',
              url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG48.png',
              mining_type: MiningType.find_by(acronym: 'PoW') # Encontra um elemento
          },
          {
              description: 'DashCoin',
              acronym: 'DASH',
              url_image: 'https://mbtskoudsalg.com/images/dash-coin-png-5.png',
              mining_type: MiningType.all.sample
          },
          {
              description: 'Ethereum',
              acronym: 'ETH',
              url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png',
              mining_type: MiningType.all.sample
          },
          {
              description: 'Zcoin',
              acronym: 'ZCOIN',
              url_image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiL6sbt3k65WOTbZ_lXr25QxTX7C1eA5Ka8U-ca4FBcGskoB8b',
              mining_type: MiningType.all.sample
          },
          {
              description: 'Cardano',
              acronym: 'CARD',
              url_image: 'https://pbs.twimg.com/media/DK4ChOZU8AE8GuQ.jpg',
              mining_type: MiningType.all.sample
          }
      ];

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastrando tipos de mineração..."
  task add_mining_types: :environment do
    show_spinner("Cadastrando Tipos de Mineração...") do 
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ];


      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private 
  
  def show_spinner(msg_start, msg_end = "Concluído!") 
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
