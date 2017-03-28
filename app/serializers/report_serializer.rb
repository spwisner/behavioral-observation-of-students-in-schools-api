# frozen_string_literal: true

class ReportSerializer < ActiveModel::Serializer
  attributes :id, :presenting_issue, :class_behav_assess, :r_setting, :r_aet,
             :r_pet, :r_oftm, :r_oftv, :r_oftp, :r_finding, :r_customone,
             :r_customtwo, :r_customthree, :custom_one_title,
             :custom_two_title, :custom_three_title, :r_recommendation,
             :counselor_name, :editable

  def editable
    scope == object.user
  end
end
