# frozen_string_literal: true

require 'spec_helper'

describe Lita::Handlers::Amesh::Downloader do
  describe '#rain_gif_path' do
    let(:downloader) { described_class.new }
    subject { downloader.send(:rain_gif_path) }

    before do
      allow(Time).to receive(:now).and_return(current_time)
    end

    context 'when a current time is divisible by 5' do
      let(:current_time) { Time.new(2018, 1, 1, 0, 0) }

      it 'returns an url path based on a current time' do
        expect(subject).to eq('mesh/000/201801010000.gif')
      end
    end

    context 'when a current time is not divisible by 5' do
      let(:current_time) { Time.new(2018, 1, 1, 0, 1) }

      it 'returns an url path based on the time that is divisible by 5 before a current time' do
        expect(subject).to eq('mesh/000/201801010000.gif')
      end
    end
  end
end
