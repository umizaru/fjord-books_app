# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    report = Report.create!(user_id: users(:alice).id, title: 'サンプルな件名', content: 'サンプルな内容')
    user = users(:alice)
    assert report.editable?(user)
  end

  test 'created_on?' do
    report = Report.create!(user_id: users(:alice).id, title: 'サンプルな件名', content: 'サンプルな内容')
    assert_equal report.created_at.to_date, report.created_on
  end
end
