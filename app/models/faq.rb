# frozen_string_literal: true

class Faq < ApplicationRecord
  # "Triggers"
  before_create :set_number
  before_update :adjust_numbers
  # Validations
  validates :question, presence: true
  validates :answer, presence: true
  validates :number, uniqueness: true

  private

  def set_number
    self.number = Faq.maximum(:number).to_i + 1
  end

  def adjust_numbers
    return unless number_changed?

    Faq.where(number: number..).order(:number).each_with_index do |faq, index|
      faq.update_columns(number: number + index + 1)
    end
  end

  def as_json
    {
      number: number,
      question: question,
      answer: answer,
    }
  end

  def ordered
    Faq.order(:number)
  end
end
