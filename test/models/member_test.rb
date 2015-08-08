require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
	@member = members :matias
  end

  test "member should be valid" do
	assert @member.valid?
  end

end
