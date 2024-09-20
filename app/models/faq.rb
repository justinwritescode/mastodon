# frozen_string_literal: true

class Faq < ApplicationRecord
  # Callbacks
  before_create :set_number
  before_update :adjust_numbers

  # Validations
  validates :question, presence: true
  validates :answer, presence: true
  validates :number, uniqueness: true

  # Public instance methods
  def as_json(options = {})
    {
      id: id,
      number: number,
      question: question,
      answer: answer,
    }
  end

  # Class methods
  def self.ordered
    Faq.order(:number)
  end

  private

  # Private instance methods
  def set_number
    self.number = Faq.maximum(:number).to_i + 1
  end

  def adjust_numbers
    return unless number_changed?

    Faq.where('number >= ?', number).order(:number).each_with_index do |faq, index|
      faq.update_columns(number: number + index + 1)
    end
  end
end
