require 'rails_helper'

RSpec.describe SeekerProfilesController, type: :controller do
  describe "POST #create" do
    context "when attributes are valid" do
      it "creates a seeker ptofile" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by(1)
      end
      it "redirects to root_path" do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to root_path
      end
    end
    end

   context "when attributes are invalid" do
      it "doesn't create a seeker ptofile" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:invalid_post)
        }.to change(Post, :count).by(0)
      end
      it "renders the new template" do
        post :create, post: FactoryGirl.attributes_for(:invalid_post)
        expect(response).to render_template :new
      end
    end
   end
end
