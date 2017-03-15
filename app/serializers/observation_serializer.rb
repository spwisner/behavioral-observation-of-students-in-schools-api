# frozen_string_literal: true

class ObservationSerializer < ActiveModel::Serializer
  attributes :id, :aet, :pet, :oft_m, :oft_v, :oft_p, :obs_comment, :obs_num
end
