require "rails_helper"

RSpec.describe "SessionsController", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:session) { { email: user.email, password: user.password } }

  describe "POST /sign_in" do
    before { post "/signin", params: { user: session } }

    context "When valid params" do
      it "Return status code 200" do
        expect(response).to have_http_status 200
      end
    end

    context "When invalid email" do
      let(:session) { { email: nil, password: user.password } }

      it "Return status code 422" do
        expect(response).to have_http_status 422
      end
    end

    context "When invalid password" do
      let(:session) { { email: user.email, password: nil } }

      it "Return status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end
end
