fixtures = Rails.root.join('db', 'seeds')
SeedFu.seed(ENV['NO_ENV'] ? [fixtures] : [fixtures, File.join(fixtures, Rails.env)])
