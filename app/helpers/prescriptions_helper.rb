module PrescriptionsHelper
  def prescription_error_messages!
    return '' if @prescription.errors.empty?

    messages = @prescription.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: @prescription.errors.count,
      resource: @prescription.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <p>#{messages}</p>
    </div>
    HTML

    html.html_safe
  end
end
