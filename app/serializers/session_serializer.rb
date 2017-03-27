# frozen_string_literal: true

class SessionSerializer < ActiveModel::Serializer
  attributes :id, :obs_on, :obs_setting, :obs_task, :obs_time, :int_num,
             :comment, :completed, :editable
  def editable
   scope == object.user
  end
end
