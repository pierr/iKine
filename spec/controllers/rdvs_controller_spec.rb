require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe RdvsController do

  def mock_rdv(stubs={})
    @mock_rdv ||= mock_model(Rdv, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all rdvs as @rdvs" do
      Rdv.stub(:all) { [mock_rdv] }
      get :index
      assigns(:rdvs).should eq([mock_rdv])
    end
  end

  describe "GET show" do
    it "assigns the requested rdv as @rdv" do
      Rdv.stub(:find).with("37") { mock_rdv }
      get :show, :id => "37"
      assigns(:rdv).should be(mock_rdv)
    end
  end

  describe "GET new" do
    it "assigns a new rdv as @rdv" do
      Rdv.stub(:new) { mock_rdv }
      get :new
      assigns(:rdv).should be(mock_rdv)
    end
  end

  describe "GET edit" do
    it "assigns the requested rdv as @rdv" do
      Rdv.stub(:find).with("37") { mock_rdv }
      get :edit, :id => "37"
      assigns(:rdv).should be(mock_rdv)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created rdv as @rdv" do
        Rdv.stub(:new).with({'these' => 'params'}) { mock_rdv(:save => true) }
        post :create, :rdv => {'these' => 'params'}
        assigns(:rdv).should be(mock_rdv)
      end

      it "redirects to the created rdv" do
        Rdv.stub(:new) { mock_rdv(:save => true) }
        post :create, :rdv => {}
        response.should redirect_to(rdv_url(mock_rdv))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rdv as @rdv" do
        Rdv.stub(:new).with({'these' => 'params'}) { mock_rdv(:save => false) }
        post :create, :rdv => {'these' => 'params'}
        assigns(:rdv).should be(mock_rdv)
      end

      it "re-renders the 'new' template" do
        Rdv.stub(:new) { mock_rdv(:save => false) }
        post :create, :rdv => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested rdv" do
        Rdv.stub(:find).with("37") { mock_rdv }
        mock_rdv.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rdv => {'these' => 'params'}
      end

      it "assigns the requested rdv as @rdv" do
        Rdv.stub(:find) { mock_rdv(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:rdv).should be(mock_rdv)
      end

      it "redirects to the rdv" do
        Rdv.stub(:find) { mock_rdv(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(rdv_url(mock_rdv))
      end
    end

    describe "with invalid params" do
      it "assigns the rdv as @rdv" do
        Rdv.stub(:find) { mock_rdv(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:rdv).should be(mock_rdv)
      end

      it "re-renders the 'edit' template" do
        Rdv.stub(:find) { mock_rdv(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested rdv" do
      Rdv.stub(:find).with("37") { mock_rdv }
      mock_rdv.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the rdvs list" do
      Rdv.stub(:find) { mock_rdv }
      delete :destroy, :id => "1"
      response.should redirect_to(rdvs_url)
    end
  end

end
