require "rails_helper"

RSpec.describe "UsersController", type: :request do
  describe "POST /signup" do
    let!(:user) { FactoryBot.attributes_for(:user) }
    
    before { post "/signup", params: { user: user } }

    context "When the request is valid" do
      it "Returns status code 200" do
        expect(response).to have_http_status 200
      end
    end

    context "When the request is invalid" do
      let!(:user) { { fullname: nil } }

      it "Returns status code 400" do
        expect(response).to have_http_status 422
      end
    end
  end
end
