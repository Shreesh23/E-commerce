require "rails_helper"

RSpec.describe ItemsController, :type => :controller do
    controller do
        def index
          render :json => {}, :status => 209
        end
        def create
            render :json => {}, :status => 302
        end
        def new
            render :json => {}, :status => 200
        end
    end
    describe "GET #index" do
        it "returns a 209 custom status code" do
          get :index
          expect(response).to have_http_status(209)
        end
        it "returns a 209 custom status code" do
            post :create
            expect(response).to have_http_status(302)
        end
        it "returns a 209 custom status code" do
            get :new
            expect(response).to have_http_status(200)
        end
    end
end