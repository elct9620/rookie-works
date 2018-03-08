# frozen_string_literal: true

every 1.day, at: '2:00 am' do
  rake '-s sitemap:refresh'
end
