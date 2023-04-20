require "rails_helper"

RSpec.describe ProjectsController, :type => :controller do
    # Add this
    login_user

    let(:valid_attributes) {
        { :title => "Test title!", :description => "This is a test description"}
    }
    
    let(:valid_session) { {} }

    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:project) { Project.create(title: "Test title", description: "Test description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        
        context "DELETE #index" do
        let!(:project) { Project.create(title: "Test title", description: "Test description") }
        it "returns a success response" do
            delete :index
            expect(response).to have_http_status(:ok)
        end

        it "returns a success response" do
            Project.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

        
    end
end
