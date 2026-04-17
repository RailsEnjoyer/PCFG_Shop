# frozen_string_literal: true

class HomePageContent

  include Rails.application.routes.url_helpers

  Stat = Data.define(:value, :label, :detail)
  Feature = Data.define(:eyebrow, :title, :description, :link_label, :link_path, :accent)
  Step = Data.define(:number, :title, :description)
  Game = Data.define(:title, :genre, :description, :image, :eyebrow, :link_label, :link_path)
  Collection = Data.define(:eyebrow, :title, :description, :image, :link_label, :link_path, :tone)
  Accessory = Data.define(:badge, :title, :description, :price, :image, :link_label, :link_path)
  CommunityPoint = Data.define(:title, :description)

  def hero_stats
    [
      Stat.new('03', 'clear steps', 'Choose a game, tune a budget, review a ready build path.'),
      Stat.new('24/7', 'support lane', 'Use support materials and live pages instead of guessing parts alone.'),
      Stat.new('Free', 'entry point', 'asd.')
    ]
  end

  def feature_cards
    [
      Feature.new(
        'Game-first flow',
        'Build around what you play, not a blank spec sheet.',
        'asd.',
        'Open configurator',
        configurator_path,
        'rose'
      ),
      Feature.new(
        'Storefront clarity',
        'Jump from recommendation to catalogue without context switching.',
        'asd.',
        'Browse catalogue',
        catalogue_path,
        'gold'
      ),
      Feature.new(
        'No dead ends',
        'asd.',
        'When you need help, price context, or launch updates, the adjacent pages stay one click away.',
        'See updates',
        news_path,
        'violet'
      )
    ]
  end

  def workflow_steps
    [
      Step.new(
        '01',
        'Pick a direction',
        'Choose the kind of experience you want first: competitive, cinematic, balanced, or budget-friendly.'
      ),
      Step.new(
        '02',
        'Shape the build',
        'Use the configurator to narrow the build around the games and priorities that actually matter for you.'
      ),
      Step.new(
        '03',
        'Finish with confidence',
        'asd.'
      )
    ]
  end

  def featured_games
    [
      Game.new(
        'Fortnite',
        'Esports / high refresh',
        'Fast reads, stable frame pacing, and upgrade-friendly builds matter more here than flashy overspend.',
        'games/fortnite.avif',
        'Low input lag',
        'See all games',
        games_path
      ),
      Game.new(
        'Atomic Heart',
        'Story / visual density',
        <<~TEXT.squish,
          A more cinematic profile where GPU headroom and overall balance matter when you want the world to look
          expensive.
        TEXT
        'games/atomic.jpg',
        'Cinematic load',
        'Explore game list',
        games_path
      ),
      Game.new(
        'Resident Evil 4',
        'Survival / atmosphere',
        'A build target for smooth traversal, crisp image quality, and enough breathing room for demanding scenes.',
        'games/re4.jpeg',
        'Atmosphere first',
        'Browse supported titles',
        games_path
      )
    ]
  end

  def collections
    [
      Collection.new(
        'Setup layer',
        'Accessories that finish the desk, not just the tower.',
        <<~TEXT.squish,
          From cooling and support hardware to everyday peripherals, the store can cover the quieter parts of the
          setup too.
        TEXT
        'products/chair.png',
        'Open catalogue',
        catalogue_path,
        'ember'
      ),
      Collection.new(
        'asd',
        'asd.',
        'asd.',
        'products/mouse.png',
        'Read news',
        news_path,
        'slate'
      ),
      Collection.new(
        'Support lane',
        'asd.',
        <<~TEXT.squish,
          asd.
        TEXT
        'products/holder.png',
        'Open support',
        support_path,
        'plum'
      )
    ]
  end

  def accessories
    [
      Accessory.new(
        'Cooling',
        'MasterAir Maker 8',
        'Air cooling that suits clean, airflow-first builds.',
        '$59.99',
        'products/cooler.png',
        'View catalogue',
        catalogue_path
      ),
      Accessory.new(
        'Surface',
        'Razer Firefly',
        'A sharper desk setup for everyday play sessions.',
        '$99.99',
        'products/pad.png',
        'See accessories',
        catalogue_path
      ),
      Accessory.new(
        'Stability',
        'ROG Herculx holder',
        'GPU support hardware for heavier modern cards.',
        '$79.99',
        'products/holder.png',
        'Shop support gear',
        catalogue_path
      ),
      Accessory.new(
        'Control',
        'MSI optical mouse',
        'A lightweight utility pick for a cleaner battlestation.',
        '$49.99',
        'products/mouse.png',
        'Browse peripherals',
        catalogue_path
      )
    ]
  end

  def community_points
    [
      CommunityPoint.new(
        'asd',
        'asd'
      ),
      CommunityPoint.new(
        'Fast next step',
        <<~TEXT.squish
          You can jump straight into the configurator, catalogue, support, or news from the home page without
          getting buried.
        TEXT
      ),
      CommunityPoint.new(
        'Lightweight above the fold',
        <<~TEXT.squish
          asd.
        TEXT
      )
    ]
  end

  def spotlight_title
    'A cleaner path from idea to rig.'
  end

  def spotlight_text
    <<~TEXT.squish
      asd.
    TEXT
  end

  def spotlight_bullets
    %w[
      asd
      asd
      asd
    ]
  end

end
