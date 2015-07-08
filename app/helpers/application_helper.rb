module ApplicationHelper
  def normalize_html_text(html, length: 170)
    raw(strip_tags(html.html_safe)[0..length] + ' ...')
  end

  def search_results_message
    content_tag(:div, I18n.t('flash.none_results_found'), class: 'alert alert-info')
  end
end
