# frozen_string_literal: true

require 'spec_helper'

describe Lita::Handlers::Amesh::Downloader do
  describe '#target_time' do
    let(:downloader) { described_class.new }
    subject { downloader.send(:target_time) }

    before do
      allow(Time).to receive(:now).and_return(current_time)
    end

    context 'when a current time is divisible by 5' do
      let(:current_time) { Time.new(2018, 1, 1, 0, 0) }

      it 'returns an url path based on a current time' do
        expect(subject).to eq(current_time)
      end
    end

    context 'when a current time is not divisible by 5' do
      let(:current_time) { Time.new(2018, 1, 1, 0, 1) }

      it 'returns an url path based on the time that is divisible by 5 before a current time' do
        expect(subject).to eq(Time.new(2018, 1, 1, 0, 0))
      end
    end
  end

  describe '#five_minutes_ago' do
    let(:downloader) { described_class.new }

    it 'returns a 5 minutes ago image of given time' do
      time = Time.new(2018, 1, 1, 0, 0)
      actual = downloader.send(:five_minutes_ago, time)
      expect(actual).to eq(Time.new(2017, 12, 31, 23, 55))
    end
  end
end
