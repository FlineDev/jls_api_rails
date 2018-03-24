require 'rails_helper'

RSpec.describe 'FactoryLint' do
  it 'lints all factories successfully' do
    FactoryBot.lint
  end
end
