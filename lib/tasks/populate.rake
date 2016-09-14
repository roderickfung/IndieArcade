namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    @count = 0

    address = [
      '23 Robson St, Vancouver, BC',
      '2151 Keith Road, North Vancouver, BC',
      '1763 James Street, Vancouver, BC',
      '2188 Cardero St, Vancouver, BC',
      '4766 Robson St, Vancouver, BC',
      '4397 Hastings Street, Vancouver, BC',
      '1846 Tolmie St, Vancouver, BC',
      '4922 Cordova Street, Vancouver, BC',
      '1624 Jade St, North Vancouver, BC',
      '2726 Nootka Street, Vancouver, BC'
    ]

    5.times do |x|
      @user = User.create!(
      company_name: Faker::Company.name,
      number_of_employees: rand(1..100),
      website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
      admin: [true, false].sample,
      approved_user: [true, false].sample,
      email: Faker::Internet.email,
      password: Faker::Internet.password(8)
      )
    end

    @user = User.create!(
    company_name: 'Admin',
    website: 'www.roderickfung.ca',
    admin: true,
    approved_user: true,
    number_of_employees: 1,
    email: 'codecoreroderick@gmail.com',
    password: '12345'
    )

    @user = User.create!(
    company_name: 'Developer',
    website: 'www.roderickfung.com',
    admin: false,
    approved_user: true,
    number_of_employees: 10,
    email: 'user@user.com',
    password: '12345'
    )

    100.times do |x|

      @product_name = Faker::Commerce.product_name

      Game.all.each do |g|
        loop do
          if g.title == @product_name
            @product_name = Faker::Commerce.product_name + ' ' + Faker::Lorem.word
          else
            break
          end
        end
      end

      @game = Game.create!(
      user_id: rand(1..7),
      title: @product_name,
      game_description: Faker::Lorem.paragraph(2),
      last_in_arcade: Faker::Date.between(2.years.ago, 2.days.ago),
      times_played: rand(1..100),
      status: ['Pending', 'Approved'].sample
      )
    end

    @arcade = Arcade.create!(
  title: 'Bryce\'s ballsdeep arcade',
  address: address[@count],
  phone_number: Faker::PhoneNumber.cell_phone,
  website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
  status: ['Updating', 'Operational', 'Closed'].sample,
  image: 'http://www.ilovebigals.com/wp-content/uploads/2013/04/Arcade.jpg'
  )
  @count += 1
  @arcade = Arcade.create!(
  title: 'Kepler\'s css banger arcade',
  address: address[@count],
  phone_number: Faker::PhoneNumber.cell_phone,
  website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
  status: ['Updating', 'Operational', 'Closed'].sample,
  image: 'http://is0.gaslightmedia.com/petoskeyareacvb/tbs1a/is99-1385584389-52556.jpeg'
  )
  @count += 1
  @arcade = Arcade.create!(
  title: 'Tim\'s dirty dutch arcade',
  address: address[@count],
  phone_number: Faker::PhoneNumber.cell_phone,
  website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
  status: ['Updating', 'Operational', 'Closed'].sample,
  image: 'http://i0.wp.com/cdn.makezine.com/uploads/2014/10/80s-style-arcade-room-1.jpg'
  )
  @count += 1
  @arcade = Arcade.create!(
  title: 'Raph\'s panty-dropper arcade',
  address: address[@count],
  phone_number: Faker::PhoneNumber.cell_phone,
  website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
  status: ['Updating', 'Operational', 'Closed'].sample,
  image: 'http://assets.sbnation.com/assets/1104014/2012-05-05_at_16-19-30.jpg'
  )
  @count += 1
  @arcade = Arcade.create!(
  title: 'Hyun\'s getting blazed arcade',
  address: address[@count],
  phone_number: Faker::PhoneNumber.cell_phone,
  website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
  status: ['Updating', 'Operational', 'Closed'].sample,
  image: 'http://cdn.arstechnica.net/wp-content/uploads/2014/05/arcade-5.jpg'
  )
  @count += 1
  @arcade = Arcade.create!(
  title: 'Emily\'s scissor sisters arcade',
  address: address[@count],
  phone_number: Faker::PhoneNumber.cell_phone,
  website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
  status: ['Updating', 'Operational', 'Closed'].sample,
  image: 'http://www.fantasyisland.co.uk/wp-content/uploads/2014/09/Arcade4.jpg'
  )
  @count += 1
  @arcade = Arcade.create!(
  title: 'Nicole\'s big pimpin arcade',
  address: address[@count],
  phone_number: Faker::PhoneNumber.cell_phone,
  website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
  status: ['Updating', 'Operational', 'Closed'].sample,
  image: 'http://www.arcadedocumentary.com/progress/arcadeE.jpg'
  )
  @count += 1

    100.times do |x|
      @review = Review.create!(
      game_id: rand(1..100),
      fun: rand(1..5),
      playability: rand(1..5),
      difficulty: rand(1..5)
      )
    end

    @taggings = ['Action', 'RPG', 'Sports', 'First-Person Shooter', 'Platformer', 'Puzzle', 'Escape', 'Fighting', 'Racing', 'Galaxy']

    @taggings.each do |t|
      @tag = Tag.create!(
      tag_name: t
      )
    end

  end
end
