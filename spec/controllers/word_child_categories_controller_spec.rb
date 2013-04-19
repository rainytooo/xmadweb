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

describe WordChildCategoriesController do

  # This should return the minimal set of attributes required to create a valid
  # WordChildCategory. As you add validations to WordChildCategory, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WordChildCategoriesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all word_child_categories as @word_child_categories" do
      word_child_category = WordChildCategory.create! valid_attributes
      get :index, {}, valid_session
      assigns(:word_child_categories).should eq([word_child_category])
    end
  end

  describe "GET show" do
    it "assigns the requested word_child_category as @word_child_category" do
      word_child_category = WordChildCategory.create! valid_attributes
      get :show, {:id => word_child_category.to_param}, valid_session
      assigns(:word_child_category).should eq(word_child_category)
    end
  end

  describe "GET new" do
    it "assigns a new word_child_category as @word_child_category" do
      get :new, {}, valid_session
      assigns(:word_child_category).should be_a_new(WordChildCategory)
    end
  end

  describe "GET edit" do
    it "assigns the requested word_child_category as @word_child_category" do
      word_child_category = WordChildCategory.create! valid_attributes
      get :edit, {:id => word_child_category.to_param}, valid_session
      assigns(:word_child_category).should eq(word_child_category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WordChildCategory" do
        expect {
          post :create, {:word_child_category => valid_attributes}, valid_session
        }.to change(WordChildCategory, :count).by(1)
      end

      it "assigns a newly created word_child_category as @word_child_category" do
        post :create, {:word_child_category => valid_attributes}, valid_session
        assigns(:word_child_category).should be_a(WordChildCategory)
        assigns(:word_child_category).should be_persisted
      end

      it "redirects to the created word_child_category" do
        post :create, {:word_child_category => valid_attributes}, valid_session
        response.should redirect_to(WordChildCategory.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved word_child_category as @word_child_category" do
        # Trigger the behavior that occurs when invalid params are submitted
        WordChildCategory.any_instance.stub(:save).and_return(false)
        post :create, {:word_child_category => {}}, valid_session
        assigns(:word_child_category).should be_a_new(WordChildCategory)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        WordChildCategory.any_instance.stub(:save).and_return(false)
        post :create, {:word_child_category => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested word_child_category" do
        word_child_category = WordChildCategory.create! valid_attributes
        # Assuming there are no other word_child_categories in the database, this
        # specifies that the WordChildCategory created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        WordChildCategory.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => word_child_category.to_param, :word_child_category => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested word_child_category as @word_child_category" do
        word_child_category = WordChildCategory.create! valid_attributes
        put :update, {:id => word_child_category.to_param, :word_child_category => valid_attributes}, valid_session
        assigns(:word_child_category).should eq(word_child_category)
      end

      it "redirects to the word_child_category" do
        word_child_category = WordChildCategory.create! valid_attributes
        put :update, {:id => word_child_category.to_param, :word_child_category => valid_attributes}, valid_session
        response.should redirect_to(word_child_category)
      end
    end

    describe "with invalid params" do
      it "assigns the word_child_category as @word_child_category" do
        word_child_category = WordChildCategory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WordChildCategory.any_instance.stub(:save).and_return(false)
        put :update, {:id => word_child_category.to_param, :word_child_category => {}}, valid_session
        assigns(:word_child_category).should eq(word_child_category)
      end

      it "re-renders the 'edit' template" do
        word_child_category = WordChildCategory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WordChildCategory.any_instance.stub(:save).and_return(false)
        put :update, {:id => word_child_category.to_param, :word_child_category => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested word_child_category" do
      word_child_category = WordChildCategory.create! valid_attributes
      expect {
        delete :destroy, {:id => word_child_category.to_param}, valid_session
      }.to change(WordChildCategory, :count).by(-1)
    end

    it "redirects to the word_child_categories list" do
      word_child_category = WordChildCategory.create! valid_attributes
      delete :destroy, {:id => word_child_category.to_param}, valid_session
      response.should redirect_to(word_child_categories_url)
    end
  end

end