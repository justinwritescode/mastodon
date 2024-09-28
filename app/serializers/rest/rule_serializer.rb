# frozen_string_literal: true

class REST::RuleSerializer < ActiveModel::Serializer
  attributes :id, :text, :hint

  def id
    object.id.to_s
  end

  def text
    html(object.text)
  end

  def hint
    html(object.hint)
  end

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, escape_html: true, no_images: true)
  end

  def html(value)
    markdown.render(value).html_safe # rubocop:disable Rails/OutputSafety
  end
end
