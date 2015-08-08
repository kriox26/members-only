require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  def setup
	@story = Story.new(body: "".ljust(140, "abcd"))
  end

  test "story should be valid" do
	assert @story.valid?
  end

end
