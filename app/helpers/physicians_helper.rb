module PhysiciansHelper
  def physician_error_messages!
    return '' if @physician.errors.empty?

    messages = @physician.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: @physician.errors.count,
      resource: @physician.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <p>#{messages}</p>
    </div>
    HTML

    html.html_safe
  end
end
