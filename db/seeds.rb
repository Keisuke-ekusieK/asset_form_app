User.create!(name:  "Akari Keisuke",
             email: "akari@example.com",
						 user_name: "akarin",
             password:              "password",
             password_confirmation: "password",
						 admin: true)

User.create!(name:  "Example User",
             email: "user@example.com",
						 user_name: "example_user",
             password:              "password",
             password_confirmation: "password",
						 admin: false)

# 追加のユーザーをまとめて生成する
98.times do |n|
  name  = Faker::Name.name
  email = "user#{n+2}@example.com"
	user_name = "example_#{n+2}"
  password = "password"
  User.create!(name:  name,
               email: email,
							 user_name: user_name,
               password:              password,
               password_confirmation: password)
end

# 全ユーザーに家族構成の情報を追加
users = User.order(:created_at).take(100)

spouse   = true
children = [2,2,1,3,0,4]
parent   = [0,0,0,0,0,0,1,1,2]
worker   = [2,2,2,2,1,1,3]

i = 0
users.each { |user| 
	user.build_family(spouse: spouse, 
																			children: children[i%6],
																			parent: parent[i%9],
																			worker: worker[i%7]) 
	user.save
	i += 1
}

# 全ユーザーに資産ポートフォリオを追加
domestic_currency_deposits = [100,200,300,400,500,600,1000,2000,5000]
foreign_currency_deposits  = [0,0,0,0,100,500]
domestic_stocks = [0,0,100,500,1000,2000,5000,3000,1000]
foreign_stocks = [200,300,30,0,1000,500,300,200]
domestic_bonds = [0,100,200,400,500,1000,0]
foreign_bonds = [0,100,500,200]
real_estate = [1000,500,2000,0,0]
gold = [100,200,300]
insurance = [0,0,0,0,300]
others = [50,100,500,300,1000]

j = 0
users.each { |user| 
	user.build_asset_allocation(domestic_currency_deposits: domestic_currency_deposits[j%9],
																								foreign_currency_deposits: foreign_currency_deposits[j%6],
																								domestic_stocks: domestic_stocks[j%9],
																								foreign_stocks: foreign_stocks[j%8],
																								domestic_bonds: domestic_bonds[j%7],
																								foreign_bonds: foreign_bonds[j%4],
																								real_estate: real_estate[j%5],
																								gold: gold[j%3],
																								insurance: insurance[j%5],
																								others: others[j%5]) 
	user.save!
	j += 1
}

# 最初の6人分だけ月の支出を登録する
users = User.order(:created_at).take(10)
12.times do |n|
	k = 0
  users.each do |user| 
		year = 2020
		month = n+1
		house = 50000 + 1000*n + 800*k
		food = 30000 - 100*n -100*k
		clothes = 1000*n
		education = 8000 - 200*n
		daily_necessities = 3000 + n +200*k
		car = 10000 - 100*n -100*k
		medical_treatment = 2500 + n*100
		entertainment = 300*n
		communication = 2000 + 200*n -10*k
		social = 5000 + 100*n + 300*k
		insurance = 200*n + 10*k
  	comment = Faker::Lorem.sentence(word_count: 5)

		user.monthly_expenses.create!(year: year,
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
																										comment: comment)
		k += 1
	end
end

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
