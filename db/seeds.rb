# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

coins = [
    {
        description: 'Bitcoin',
        acronym: 'BTC',
        url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG48.png'
    },
    {
        description: 'DashCoin',
        acronym: 'DASH',
        url_image: 'https://mbtskoudsalg.com/images/dash-coin-png-5.png'
    },
    {
        description: 'Ethereum',
        acronym: 'ETH',
        url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png'
    }
];

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end

spinner.success('("Moedas cadastradas com sucesso.")')