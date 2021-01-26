User.create!(name:  "Akari Keisuke",
             email: "akari@example.com",
						 user_name: "akarin",
             password:              "password",
             password_confirmation: "password",
						 admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "akari#{n+1}@example.com"
	user_name = "example_#{n+1}"
  password = "password"
  User.create!(name:  name,
               email: email,
							 user_name: user_name,
               password:              password,
               password_confirmation: password)
end

# 全ユーザーに家族構成の情報を追加
users = User.order(:created_at).take(100)

spouse = true
children = 2
parent = 0
worker = 2
users.each { |user| 
	user.build_family(spouse: spouse, 
																			children: children,
																			parent: parent,
																			worker: worker) 
	user.save
}

# 全ユーザーに資産ポートフォリオを追加
domestic_currency_deposits = 300
foreign_currency_deposits = 100
domestic_stocks = 100
foreign_stocks = 200
domestic_bonds = 0
foreign_bonds = 0
real_estate = 1000
gold = 100
insurance = 0
others = 50
users.each { |user| 
	user.build_asset_allocation(domestic_currency_deposits: domestic_currency_deposits,
																								foreign_currency_deposits: foreign_currency_deposits,
																								domestic_stocks: domestic_stocks,
																								foreign_stocks: foreign_stocks,
																								domestic_bonds: domestic_bonds,
																								foreign_bonds: foreign_bonds,
																								real_estate: real_estate,
																								gold: gold,
																								insurance: insurance,
																								others: others) 
	user.save!
}

# 最初の6人分だけ月の支出を登録する
users = User.order(:created_at).take(6)
12.times do |n|
	year = 2020
	month = n+1
	house = 40000 + 1000*n
	food = 30000 - 100*n
	clothes = 1000*n
	education = 8000 - 200*n
	daily_necessities = 3000 + n
	car = 10000 - 100*n
	medical_treatment = 2500 + n*100
	entertainment = 300*n
	communication = 2000 + 200*n
	social = 5000 + 100*n
	insurance = 200*n
  comment = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.monthly_expenses.create!(year: year,
																										month: month,
																										house: house,
																										food: food,
																										clothes: clothes,
																										education: education,
																										daily_necessities: daily_necessities,
																										car: car,
																										medical_treatment: medical_treatment,
																										entertainment: entertainment,
																										communication: communication,
																										social: social,
																										insurance: insurance,
																										comment: comment) }
end

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
