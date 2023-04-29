require "rails_helper"

RSpec.describe "Properties::Search", type: :request do
  let(:properties) { create_list(:property, 3) }

  describe "GET index" do
    it "succeeds" do
      get properties_search_path
      expect(response).to be_successful
    end
  end
end
