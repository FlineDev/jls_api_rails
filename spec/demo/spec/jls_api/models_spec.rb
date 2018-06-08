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

    it 'fails with errors for invalid data' do
      result = JlsApi::Models.instance.create(model_class: Challenge, attributes: nil)
      expect(result).to be_instance_of(ActiveModel::Errors)
      expect(result.keys).to eq([:category, :creator, :kind])
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

    it 'is nil when challenge does not exist' do
      result = JlsApi::Models.instance.show(model_class: Challenge, id: @challenge.id + 1)
      expect(result).to be_nil
    end
  end

  context 'update' do
    before(:example) do
      @challenge = FactoryBot.create(:challenge)
    end

    it 'updates a specific challenge successfully' do
      new_attributes = { title: 'Some new title' }
      result = JlsApi::Models.instance.update(model_class: Challenge, id: @challenge.id, attributes: new_attributes)
      expect(result).not_to be_nil
      expect(result).to be_instance_of(Challenge)
      expect(result.title).to eq(new_attributes[:title])
    end

    it 'fails with errors for invalid data' do
      new_attributes = { creator: nil, category: nil, kind: nil }
      result = JlsApi::Models.instance.update(model_class: Challenge, id: @challenge.id, attributes: new_attributes)
      expect(result).to be_instance_of(ActiveModel::Errors)
      expect(result.keys).to eq([:category, :creator, :kind])
    end

    it 'is nil when challenge does not exist' do
      result = JlsApi::Models.instance.update(model_class: Challenge, id: @challenge.id + 1, attributes: {})
      expect(result).to be_nil
    end
  end

  context 'destroy' do
    before(:example) do
      @challenge = FactoryBot.create(:challenge)
    end

    it 'destroys a challenge successfully' do
      expect(Challenge.count).to be > 0
      result = JlsApi::Models.instance.destroy(model_class: Challenge, id: @challenge.id)
      expect(result).to be true
      expect(Challenge.count).to be == 0
    end

    it 'is nil when challenge does not exist' do
      expect(Challenge.count).to be > 0
      result = JlsApi::Models.instance.destroy(model_class: Challenge, id: @challenge.id + 1)
      expect(result).to be_nil
      expect(Challenge.count).to be > 0
    end
  end
end
