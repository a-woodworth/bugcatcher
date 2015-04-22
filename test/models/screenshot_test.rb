# Not working. Can't figure this one out.

require 'test_helper'

class ScreenshotTest < ActiveSupport::TestCase

  def test_if_screenshot_attributes_can_be_deleted
  p1 = projects(:lantern)
  id = p1.id

  screenshot1 = p1.projects.build(screenshots_attributes: :id => "1", :image => "lantern_screenshot_v1.png")

  screenshot1.destroy
  assert_equal Project.find(id).count, 1

  end


#  assert_difference('screenshot1.count', -1) do
#    delete :destroy, screenshots_attributes: { :id, :image }
#  end

#  assert_redirected_to projects_path
#  end
end

  # test "the truth" do
  #   p1 = projects(:lantern)
  #   id = p1.id

  #   s1 = p1.screenshots.first
  #   s1.destroy
  #   assert_equal Project.find(id).count, 1
  # end

#end
