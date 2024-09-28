# frozen_string_literal: true

class REST::FaqSerializer < ActiveModel::Serializer
  attributes :id, :number, :question, :answer

  def question
    html(object.question)
  end

  def answer
    html(object.answer)
  end

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, escape_html: true, no_images: true)
  end

  def html(value)
    markdown.render(value).html_safe # rubocop:disable Rails/OutputSafety
  end
end
