require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
	@member = Member.new(name: "Matias Pan", email: "matias@valid.com", password: "foobar", password_confirmation: "foobar")
  end

  test "member should be valid" do
	assert @member.valid?
  end

  test "name should be present" do
	@member.name = "       "
	assert_not @member.valid?
  end

  test "email should be present" do
	@member.email = "       "
	assert_not @member.valid?
  end

  test "name should not be too long" do
	@member.name = "a" * 51
	assert_not @member.valid?
  end

  test "email should not be too long" do
	@member.email = "a" * 244 + "@example.com"
	assert_not @member.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
						 first.last@foo.jp alice+bob@baz.cn]
	valid_addresses.each do |address|
	  @member.email = address
	  assert @member.valid?, "#{address.inspect} should be valid"
	end

  end

  test "email addresses should be unique" do
	duplicate_user = @member.dup
	duplicate_user.email = @member.email.upcase
	@member.save
	assert_not duplicate_user.valid?
  end

  test "password should be present(non-blank)" do
	@member.password = @member.password_confirmation = " " * 6
	assert_not @member.valid?
  end

  test "password should have a minimum length" do
	@member.password = @member.password_confirmation = "a" * 5
	assert_not @member.valid?
  end

end
