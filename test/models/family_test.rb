require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
	def setup
    @user = users(:michael)
    @family = @user.build_family(spouse: true, children: 2, parent: 0, worker: 2, user_id: @user.id)
  end

  test "should be valid" do
    assert @family.valid?
  end


	###################
	# test for :user_id
	###################
  test "user id should be present" do
    @family.user_id = nil
    assert_not @family.valid?
  end

	##################
	# test for :spouse
	##################
	test "spouse column should be present" do
		@family.spouse = nil
		assert_not @family.valid?
	end

	####################
	# test for :children
	####################
	test "children column should be present" do
		@family.children = nil
		assert_not @family.valid?
	end

	##################
	# test for :parent
	##################
	test "parent column should be present" do
		@family.parent = nil
		assert_not @family.valid?
	end

	##################
	# test for :worker
	##################
	test "worker column should be present" do
		@family.worker = nil
		assert_not @family.valid?
	end

end
