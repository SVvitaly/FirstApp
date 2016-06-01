require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "user should be invalid if first_name is nil" do
  	user = User.new
  	user.valid?
  	assert_includes user.errors[:first_name],'is not present'
  end
  
  test "user should be invalid if first_name is empty string" do
  	user = User.new
  	user.first_name = ' '
  	user.invalid?
  	assert_includes user.errors[:first_name],'is not present'
  end

  test "user should be invalid if first_name is too long" do
  	user = User.new
  	user.first_name = "a"*51
  	user.valid?
  	assert_includes user.errors[:first_name],'is too long'
  end

  test "user should be valid if first_name is not too long(=50)" do
  	user = User.new
  	user.first_name = "a"*50
  	user.valid?
  	assert_not_includes user.errors[:first_name],'is too long'
  end

  test "user should be valid if first_name is not too long(<50)" do
  	user = User.new
  	user.first_name = "a"*49
  	user.valid?
  	assert_not_includes user.errors[:first_name],'is too long'
  end

  test "user should be invalid if last_name is nil" do
  	user = User.new
  	user.valid?
  	assert_includes user.errors[:last_name],'is not present'
  end
  
  test "user should be invalid if last_name is empty string" do
  	user = User.new
  	user.last_name = ' '
  	user.invalid?
  	assert_includes user.errors[:last_name],'is not present'
  end
	
  test "user should be invalid if last_name is too long" do
  	user = User.new
  	user.last_name = "a"*51
  	user.valid?
  	assert_includes user.errors[:last_name], 'is too long'
  end
  
  test "user should be valid if last_name is not too long(=50)" do
  	user = User.new
  	user.last_name = "a"*50
  	user.valid?
  	assert_not_includes user.errors[:last_name],'is too long'
  end

  test "user should be valid if last_name is not too long(<50)" do
  	user = User.new
  	user.last_name = "a"*49
  	user.valid?
  	assert_not_includes user.errors[:last_name],'is too long'
  end

  test "user should be invalid if username is nil" do
  	user = User.new
  	user.valid?
  	assert_includes user.errors[:username],'is not present'
  end
  
  test "user should be invalid if username is empty string" do
  	user = User.new
  	user.username = ' '
  	user.invalid?
  	assert_includes user.errors[:username],'is not present'
  end

  test "user should be invalid if username is too long" do
  	user = User.new
  	user.username = "a"*51
  	user.valid?
  	assert_includes user.errors[:username],'is too long'
  end

  test "user should be valid if username is uniq" do
  	user = User.new
  	user.username = "test"
  	user.valid?
  	assert_not_includes user.errors[:username], 'has already been taken'
  end

  test "user should be invalid if username is not uniq" do
  	user = User.new
  	user.username = "ttt"
  	user.valid?
  	assert_includes user.errors[:username], 'has already been taken'
  end

  test "user should be valid if phone_number is valid" do
  	user = User.new
  	user.phone_number = '375-29-323-03-55'
  	user.valid?
  	assert_not_includes user.errors[:phone_number], 'is invalid'
  end

  test "user should be invalid if phone_number is invalid" do
  	user = User.new
  	user.phone_number = '375-29-323-03-55-556'
  	user.valid?
  	assert_includes user.errors[:phone_number], 'is invalid'
  end

   test "user should be invalid if phone_number is empty string" do
  	user = User.new
  	user.phone_number = ' '
  	user.invalid?
  	assert_includes user.errors[:phone_number],'is not present'
  end


  test "user should be invalid if email is invalid" do
  	user = User.new
  	user.email = "wegwgjhgasf.rt"
  	user.valid?
  	assert_includes user.errors[:email], 'is invalid'
  end

  test "user should be invalid if email is empty string" do
  	user = User.new
  	user.email = ' '
  	user.invalid?
  	assert_includes user.errors[:email],'is not present'
  end
end
