require 'spec_helper'

require_relative '../lib/dota2_api27n'

RSpec.describe Dota2Api27n, :vcr do
  describe 'leagues' do
    context 'When call DotaLeaguesApi.leagues' do
      subject { Dota2Api27n.leagues }

      it 'success call DotaLeaguesApi.leagues' do
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
    end
  end
end
