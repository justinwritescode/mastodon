# frozen_string_literal: true

class REST::FaqSerializer < ActiveModel::Serializer
  attributes :id, :number, :question, :answer
end
