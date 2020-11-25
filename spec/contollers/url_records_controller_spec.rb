require 'rails_helper'

RSpec.describe "UrlRecordsController", type: :request do
  describe 'POST /urls' do
    subject { post('/urls', params: params) }

    let(:params) { { url: 'http://test.com' } }

    it 'creates record' do
      expect { subject }.to change(UrlRecord, :count)
    end

    it 'returns URL with uuid' do
      subject
      expect(body).to eq("http://www.example.com/urls/#{UrlRecord.last.uuid}")
    end
  end

  describe 'GET /urls/:id' do
    subject { get("/urls/#{url.uuid}") }

    let(:url) { UrlRecord.create!(original_url: 'http://test.com', uuid: SecureRandom.uuid) }

    it 'increments counter' do
      expect do
        subject
        url.reload
      end.to change(url, :counter).by(1)
    end

    it 'returns URL' do
      subject
      expect(body).to eq('http://test.com')
    end
  end

  describe 'GET /urls/:id/stats' do
    subject { get("/urls/#{url.uuid}/stats") }

    let(:url) { UrlRecord.create!(original_url: 'http://test.com', uuid: SecureRandom.uuid, counter: 10) }

    it 'returns counter' do
      subject
      expect(body).to eq(url.counter.to_s)
    end
  end
end
