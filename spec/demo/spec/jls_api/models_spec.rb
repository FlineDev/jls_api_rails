require 'rails_helper'

RSpec.describe 'JlsApi::Models' do
  context 'index' do
    before(:example) do
      @challenges = FactoryBot.create_list(:challenge, 30)
    end

    it 'fetches all challenges correctly' do
      result = JlsApi::Models.instance.index(model_class: Challenge)
      expect(result.count).to be == 30
      expect(result).to match_array(@challenges)
    end
  end

  context 'create' do
    it 'creates a new challenge successfully' do
      attributes = FactoryBot.attributes_with_foreign_keys_for(:challenge)
      result = JlsApi::Models.instance.create(model_class: Challenge, attributes: attributes)
      expect(result).not_to be_nil
      expect(result).to be_valid
    end
  end

  context 'show' do
    before(:example) do
      @challenge = FactoryBot.create(:challenge)
    end

    it 'shows a specific challenge successfully' do
      result = JlsApi::Models.instance.show(model_class: Challenge, id: @challenge.id)
      expect(result).not_to be_nil
      expect(result).to eq(@challenge)
    end
  end

  context 'update' do
    before(:example) do
      @challenge = FactoryBot.create(:challenge)
    end

    it 'updates a specific challenge successfully' do
      new_title = 'Some new title'
      result = JlsApi::Models.instance.update(model_class: Challenge, id: @challenge.id, attributes: { title: new_title })
      expect(result).not_to be_nil
      expect(result).to be_instance_of(Challenge)
      expect(result.title).to eq(new_title)
    end
  end

  context 'destroy' do
    before(:example) do
      @challenge = FactoryBot.create(:challenge)
    end

    it 'destroys a challenge successfully' do
      expect(Challenge.count).to be > 0
      JlsApi::Models.instance.destroy(model_class: Challenge, id: @challenge.id)
      expect(Challenge.count).to be == 0
    end
  end
end
