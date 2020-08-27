require 'spec_helper'

require_relative '../lib/dota2_api27n'

RSpec.describe Dota2Api27n, :vcr do
  context 'When call Dota2Api27n.leagues' do
    subject { Dota2Api27n.leagues }

    it 'success call Dota2Api27n.leagues' do
      expect(subject.first).to have_attributes total_prize_pool: 500000
      expect(subject.first).to have_attributes  start_timestamp: 1596142800
      expect(subject.first).to have_attributes    end_timestamp: 1599598800
      expect(subject.first).to have_attributes        league_id: 12245
      expect(subject.first).to have_attributes          is_live: true
      expect(subject.first).to have_attributes           region: 4
      expect(subject.first).to have_attributes           status: 3
      expect(subject.first).to have_attributes             name: 'OMEGA League'
      expect(subject.first).to have_attributes             tier: 2
      expect(subject.first).to have_attributes              url: 'epicenter.gg'
    end

    it 'failure call Dota2Api27n.leagues' do
      expect{ Dota2Api27n.leagues(offset: 0, limit: 0) }.to raise_error(Dota2Api27n::RequestEmpty)
    end
  end

  context 'When call Dota2Api27n.leagues' do
    it 'success call Dota2Api27n.total_leagues' do
      expect(Dota2Api27n.total_leagues).to eq 291
    end
  end
end
