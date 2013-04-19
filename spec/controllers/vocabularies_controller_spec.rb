require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VocabulariesController do

  # This should return the minimal set of attributes required to create a valid
  # Vocabulary. As you add validations to Vocabulary, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VocabulariesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all vocabularies as @vocabularies" do
      vocabulary = Vocabulary.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vocabularies).should eq([vocabulary])
    end
  end

  describe "GET show" do
    it "assigns the requested vocabulary as @vocabulary" do
      vocabulary = Vocabulary.create! valid_attributes
      get :show, {:id => vocabulary.to_param}, valid_session
      assigns(:vocabulary).should eq(vocabulary)
    end
  end

  describe "GET new" do
    it "assigns a new vocabulary as @vocabulary" do
      get :new, {}, valid_session
      assigns(:vocabulary).should be_a_new(Vocabulary)
    end
  end

  describe "GET edit" do
    it "assigns the requested vocabulary as @vocabulary" do
      vocabulary = Vocabulary.create! valid_attributes
      get :edit, {:id => vocabulary.to_param}, valid_session
      assigns(:vocabulary).should eq(vocabulary)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vocabulary" do
        expect {
          post :create, {:vocabulary => valid_attributes}, valid_session
        }.to change(Vocabulary, :count).by(1)
      end

      it "assigns a newly created vocabulary as @vocabulary" do
        post :create, {:vocabulary => valid_attributes}, valid_session
        assigns(:vocabulary).should be_a(Vocabulary)
        assigns(:vocabulary).should be_persisted
      end

      it "redirects to the created vocabulary" do
        post :create, {:vocabulary => valid_attributes}, valid_session
        response.should redirect_to(Vocabulary.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vocabulary as @vocabulary" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vocabulary.any_instance.stub(:save).and_return(false)
        post :create, {:vocabulary => {}}, valid_session
        assigns(:vocabulary).should be_a_new(Vocabulary)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vocabulary.any_instance.stub(:save).and_return(false)
        post :create, {:vocabulary => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vocabulary" do
        vocabulary = Vocabulary.create! valid_attributes
        # Assuming there are no other vocabularies in the database, this
        # specifies that the Vocabulary created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vocabulary.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => vocabulary.to_param, :vocabulary => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested vocabulary as @vocabulary" do
        vocabulary = Vocabulary.create! valid_attributes
        put :update, {:id => vocabulary.to_param, :vocabulary => valid_attributes}, valid_session
        assigns(:vocabulary).should eq(vocabulary)
      end

      it "redirects to the vocabulary" do
        vocabulary = Vocabulary.create! valid_attributes
        put :update, {:id => vocabulary.to_param, :vocabulary => valid_attributes}, valid_session
        response.should redirect_to(vocabulary)
      end
    end

    describe "with invalid params" do
      it "assigns the vocabulary as @vocabulary" do
        vocabulary = Vocabulary.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vocabulary.any_instance.stub(:save).and_return(false)
        put :update, {:id => vocabulary.to_param, :vocabulary => {}}, valid_session
        assigns(:vocabulary).should eq(vocabulary)
      end

      it "re-renders the 'edit' template" do
        vocabulary = Vocabulary.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vocabulary.any_instance.stub(:save).and_return(false)
        put :update, {:id => vocabulary.to_param, :vocabulary => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vocabulary" do
      vocabulary = Vocabulary.create! valid_attributes
      expect {
        delete :destroy, {:id => vocabulary.to_param}, valid_session
      }.to change(Vocabulary, :count).by(-1)
    end

    it "redirects to the vocabularies list" do
      vocabulary = Vocabulary.create! valid_attributes
      delete :destroy, {:id => vocabulary.to_param}, valid_session
      response.should redirect_to(vocabularies_url)
    end
  end

end
