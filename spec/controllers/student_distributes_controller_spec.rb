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

describe StudentDistributesController do

  # This should return the minimal set of attributes required to create a valid
  # StudentDistribute. As you add validations to StudentDistribute, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StudentDistributesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all student_distributes as @student_distributes" do
      student_distribute = StudentDistribute.create! valid_attributes
      get :index, {}, valid_session
      assigns(:student_distributes).should eq([student_distribute])
    end
  end

  describe "GET show" do
    it "assigns the requested student_distribute as @student_distribute" do
      student_distribute = StudentDistribute.create! valid_attributes
      get :show, {:id => student_distribute.to_param}, valid_session
      assigns(:student_distribute).should eq(student_distribute)
    end
  end

  describe "GET new" do
    it "assigns a new student_distribute as @student_distribute" do
      get :new, {}, valid_session
      assigns(:student_distribute).should be_a_new(StudentDistribute)
    end
  end

  describe "GET edit" do
    it "assigns the requested student_distribute as @student_distribute" do
      student_distribute = StudentDistribute.create! valid_attributes
      get :edit, {:id => student_distribute.to_param}, valid_session
      assigns(:student_distribute).should eq(student_distribute)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new StudentDistribute" do
        expect {
          post :create, {:student_distribute => valid_attributes}, valid_session
        }.to change(StudentDistribute, :count).by(1)
      end

      it "assigns a newly created student_distribute as @student_distribute" do
        post :create, {:student_distribute => valid_attributes}, valid_session
        assigns(:student_distribute).should be_a(StudentDistribute)
        assigns(:student_distribute).should be_persisted
      end

      it "redirects to the created student_distribute" do
        post :create, {:student_distribute => valid_attributes}, valid_session
        response.should redirect_to(StudentDistribute.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved student_distribute as @student_distribute" do
        # Trigger the behavior that occurs when invalid params are submitted
        StudentDistribute.any_instance.stub(:save).and_return(false)
        post :create, {:student_distribute => {}}, valid_session
        assigns(:student_distribute).should be_a_new(StudentDistribute)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        StudentDistribute.any_instance.stub(:save).and_return(false)
        post :create, {:student_distribute => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested student_distribute" do
        student_distribute = StudentDistribute.create! valid_attributes
        # Assuming there are no other student_distributes in the database, this
        # specifies that the StudentDistribute created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        StudentDistribute.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => student_distribute.to_param, :student_distribute => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested student_distribute as @student_distribute" do
        student_distribute = StudentDistribute.create! valid_attributes
        put :update, {:id => student_distribute.to_param, :student_distribute => valid_attributes}, valid_session
        assigns(:student_distribute).should eq(student_distribute)
      end

      it "redirects to the student_distribute" do
        student_distribute = StudentDistribute.create! valid_attributes
        put :update, {:id => student_distribute.to_param, :student_distribute => valid_attributes}, valid_session
        response.should redirect_to(student_distribute)
      end
    end

    describe "with invalid params" do
      it "assigns the student_distribute as @student_distribute" do
        student_distribute = StudentDistribute.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        StudentDistribute.any_instance.stub(:save).and_return(false)
        put :update, {:id => student_distribute.to_param, :student_distribute => {}}, valid_session
        assigns(:student_distribute).should eq(student_distribute)
      end

      it "re-renders the 'edit' template" do
        student_distribute = StudentDistribute.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        StudentDistribute.any_instance.stub(:save).and_return(false)
        put :update, {:id => student_distribute.to_param, :student_distribute => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested student_distribute" do
      student_distribute = StudentDistribute.create! valid_attributes
      expect {
        delete :destroy, {:id => student_distribute.to_param}, valid_session
      }.to change(StudentDistribute, :count).by(-1)
    end

    it "redirects to the student_distributes list" do
      student_distribute = StudentDistribute.create! valid_attributes
      delete :destroy, {:id => student_distribute.to_param}, valid_session
      response.should redirect_to(student_distributes_url)
    end
  end

end
