require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user =        User.new(name: "Example User", 
														email: "foobar@example.com", 
														user_name: "example", 
														password: "foobar",
														password_confirmation: "foobar")
		@other_user =  User.new(name: "Sample User", 
														email: "barfoo@example.com", 
														user_name: "sample",
														password: "foobar",
														password_confirmation: "foobar")
		@michael = users(:michael)
	end

	test "should be valid" do
		assert @user.valid?
	end

	#test "associated family should be destroyed" do
	#	@user.save
  #  @user.build_family(spouse: true, children: 2, parent: 0, worker: 2, user_id: @user.id)
  #  assert_difference 'Family.count', -1 do
  #    @user.destroy
  #  end
  #end

	################
	# test for :name
	################
	test "name should be present" do
		@user.name = "   "
		assert_not @user.valid?
	end

	test "name should not be too long" do
		@user.name = "a"*51
		assert_not @user.valid?
	end

	test "name should not be too short" do
		@user.name = "a"*2
		assert_not @user.valid?
	end

	#################
	# test for :email
	#################
	test "email should be present" do
		@user.email = "    "
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "b"*244 + "@example.com"
		assert_not @user.valid?
	end

	test "email should accept valid addresses" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "email should be unique" do
		@other_user.email = @user.email.upcase
		@user.save
		assert_not @other_user.valid?
	end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

	#####################
	# test for :user_name
	#####################
	test "user name should be present" do
		@user.user_name = "      "
		assert_not @user.valid?
	end

	test "user name should not be too short" do
		@user.user_name = "c"*4
		assert_not @user.valid?
	end

	test "user name should not be too long" do
		@user.user_name = "c"*16
		assert_not @user.valid?
	end

	test "user name should composed of alphanumeric characters or underscores" do
		valid_addresses = %w[______ abcdef 123456 ___abc abc123 123___ _a1_b2]
		valid_addresses.each do |valid_address|
			@user.user_name = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "user name should not be included other than alphanumeric characters or underscores" do
		invalid_addresses = %w[abcde+ abcde* abcde\ abcde? abcde! abcde\ abcde~ abcde- abcde= abcde< abcde> abcde. abcde,]
		invalid_addresses.each do |invalid_address|
			@user.user_name = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end

	test "user name should be unique" do
		@other_user.user_name = @user.user_name
		@user.save
		assert_not @other_user.valid?
	end

	test "user name should be saved as lower-case" do
    mixed_case_username = "FooExAMPle"
    @user.user_name = mixed_case_username
    @user.save
    assert_equal mixed_case_username.downcase, @user.reload.user_name
  end

	####################
	# test for :password
	####################
	test "password should be present" do
		@user.password = @user.password_confirmation = " "*6
		assert_not @user.valid?
	end

	test "password should not be too short" do
		@user.password = @user.password_confirmation = "d"*5
		assert_not @user.valid?
	end

	test "feed should have the right posts" do
    michael = users(:michael)
    archer  = users(:archer)
    lana    = users(:lana)
    # フォローしているユーザーの投稿を確認
    lana.monthly_expenses.each do |post_following|
      assert michael.feed.include?(post_following)
    end
    # 自分自身の投稿を確認
    michael.monthly_expenses.each do |post_self|
      assert michael.feed.include?(post_self)
    end
    # フォローしていないユーザーの投稿を確認
    archer.monthly_expenses.each do |post_unfollowed|
      assert_not michael.feed.include?(post_unfollowed)
    end
  end
end
