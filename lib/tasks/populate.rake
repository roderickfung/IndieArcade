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
    company_name: 'Roderick Co',
    website: 'www.roderickfung.ca',
    admin: true,
    approved_user: true,
    number_of_employees: 1,
    email: 'codecoreroderick@gmail.com',
    password: '12345'
    )

    100.times do |x|
      @game = Game.create!(
      user_id: rand(1..6),
      title: Faker::Commerce.product_name,
      game_description: Faker::Lorem.paragraph(2),
      last_in_arcade: Faker::Date.between(2.years.ago, 2.days.ago),
      times_played: rand(1..100),
      status: ['Released', 'Unreleased', 'Pending', 'Rejected'].sample,
      categories: ['Action', 'RPG', 'Platform', 'Puzzle', 'Sports'].sample
      )
    end

    10.times do |x|
      @company_name = Faker::Company.name + Faker::Company.suffix
      @arcade = Arcade.create!(
      title: @count.to_s + ' ' + @company_name,
      address: address[@count],
      phone_number: Faker::PhoneNumber.cell_phone,
      website: 'www.'+Faker::Internet.domain_word+'.'+Faker::Internet.domain_suffix,
      status: ['Updating', 'Operational', 'Closed'].sample,
      )
      @count += 1
    end

  end
end
