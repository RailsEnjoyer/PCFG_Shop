# frozen_string_literal: true

module ApplicationHelper

  def primary_navigation_items
    [
      ['Home', root_path],
      ['Catalogue', catalogue_path],
      ['Configurator', configurator_path],
      ['News', news_path],
      ['About Us', about_path],
      ['FAQ / Support', support_path]
    ]
  end

  def social_navigation_items
    [
      ['YouTube', 'logos/yt.png', 'https://www.youtube.com/'],
      ['Telegram', 'logos/tg.png', 'https://telegram.org/'],
      ['Instagram', 'logos/inst.png', 'https://www.instagram.com/']
    ]
  end

  def primary_navigation_link_classes(path, extra_classes: nil)
    classes = %w[menu__link primary-nav__link]
    classes << 'primary-nav__link--active' if current_page?(path)
    classes << extra_classes if extra_classes.present?
    classes.join(' ')
  end

end
