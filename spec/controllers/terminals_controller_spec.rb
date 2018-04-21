require 'rails_helper'

RSpec.describe TerminalsController, type: :controller do
  render_views

  before(:each) do
    @terminal = FactoryGirl.create(:terminal)
  end

  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end

    it 'assigns @terminal 'do
      get :index
      expect(assigns(:terminals)).to eq(Terminal.all)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end

    it 'renders xml data' do
      get :index, :format => :xml
      expect(response).to be_success
      expect(response.body).to include("<terminals>")
      expect(response.body).to include("<terminal>")
      expect(response.body).to include("<name>")
      expect(response.body).to include("<description>")
    end

    it 'renders JSON data' do
      get :index, :format => :json
      expect(response).to be_success
      body = JSON.parse(response.body)
      expect(body[0]["id"]).to eq(@terminal.id)
    end
  end

  context 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template("new")
    end
  end

  context 'GET #show' do
    it 'assigns the requested terminal to @terminal' do
      get :show, params: {id: @terminal.to_param}

      expect(response).to be_success
      expect(assigns(:terminal)).to eq(@terminal)
    end

    it 'renders the show template' do
      get :show, params: {id: @terminal.to_param}

      expect(response).to render_template("show")
    end
  end

  context 'DELETE #destroy' do
    it 'redirects to terminal#index' do
      delete :destroy, params: { id: @terminal.to_param }

      expect(response).to redirect_to(terminals_url)
    end

    it 'deletes the terminal' do
      expect{
         delete :destroy, params: { id: @terminal.to_param }
       }.to change(Terminal,:count).by(-1)
    end
  end

  context 'POST #create' do
    it "creates a new terminal" do
      expect{
        post :create, params: { terminal: FactoryGirl.attributes_for(:terminal) }
      }.to change(Terminal,:count).by(1)
    end

    it "redirects to the new terminal" do
      post :create, params: { terminal: FactoryGirl.attributes_for(:terminal) }
      expect(response).to redirect_to(terminal_url(Terminal.last))
    end

    it "does not save the invalid terminal" do
      expect{
        post :create, params: { terminal: FactoryGirl.attributes_for(:invalid_terminal) }
      }.to_not change(Terminal,:count)
    end

    it "does not render terminal_url for invalid data" do
      post :create, params: { terminal: FactoryGirl.attributes_for(:invalid_terminal) }
      expect(response).to render_template("new")
    end
  end

  context 'PUT #update' do
    it "located the requested @terminal" do
      put :update, params: { id: @terminal.to_param, terminal: FactoryGirl.attributes_for(:terminal) }
      expect(assigns(:terminal)).to eq(@terminal)
    end

    it "changes @terminal's attributes" do
      put :update, params: { id: @terminal.to_param, terminal: FactoryGirl.attributes_for(:terminal, description: "test terminal linux") }
      @terminal.reload

      expect(@terminal.description).to eq("test terminal linux")
    end

    it "redirects to the updated terminal" do
      put :update, params: { id: @terminal.to_param, terminal: FactoryGirl.attributes_for(:invalid_terminal, description:"test terminal linux" ) }
      @terminal.reload

      expect(@terminal.description).not_to eql("test terminal linux")
    end

    it "does not upadte the terminal for invalid data" do
      expect{
        put :update, params: { id: @terminal.to_param, terminal: FactoryGirl.attributes_for(:invalid_terminal) }
      }.to_not change(Terminal,:count)
    end

  end
end
