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

describe CourseContentsController do

  # This should return the minimal set of attributes required to create a valid
  # CourseContent. As you add validations to CourseContent, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CourseContentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all course_contents as @course_contents" do
      course_content = CourseContent.create! valid_attributes
      get :index, {}, valid_session
      assigns(:course_contents).should eq([course_content])
    end
  end

  describe "GET show" do
    it "assigns the requested course_content as @course_content" do
      course_content = CourseContent.create! valid_attributes
      get :show, {:id => course_content.to_param}, valid_session
      assigns(:course_content).should eq(course_content)
    end
  end

  describe "GET new" do
    it "assigns a new course_content as @course_content" do
      get :new, {}, valid_session
      assigns(:course_content).should be_a_new(CourseContent)
    end
  end

  describe "GET edit" do
    it "assigns the requested course_content as @course_content" do
      course_content = CourseContent.create! valid_attributes
      get :edit, {:id => course_content.to_param}, valid_session
      assigns(:course_content).should eq(course_content)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CourseContent" do
        expect {
          post :create, {:course_content => valid_attributes}, valid_session
        }.to change(CourseContent, :count).by(1)
      end

      it "assigns a newly created course_content as @course_content" do
        post :create, {:course_content => valid_attributes}, valid_session
        assigns(:course_content).should be_a(CourseContent)
        assigns(:course_content).should be_persisted
      end

      it "redirects to the created course_content" do
        post :create, {:course_content => valid_attributes}, valid_session
        response.should redirect_to(CourseContent.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved course_content as @course_content" do
        # Trigger the behavior that occurs when invalid params are submitted
        CourseContent.any_instance.stub(:save).and_return(false)
        post :create, {:course_content => {}}, valid_session
        assigns(:course_content).should be_a_new(CourseContent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CourseContent.any_instance.stub(:save).and_return(false)
        post :create, {:course_content => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested course_content" do
        course_content = CourseContent.create! valid_attributes
        # Assuming there are no other course_contents in the database, this
        # specifies that the CourseContent created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CourseContent.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => course_content.to_param, :course_content => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested course_content as @course_content" do
        course_content = CourseContent.create! valid_attributes
        put :update, {:id => course_content.to_param, :course_content => valid_attributes}, valid_session
        assigns(:course_content).should eq(course_content)
      end

      it "redirects to the course_content" do
        course_content = CourseContent.create! valid_attributes
        put :update, {:id => course_content.to_param, :course_content => valid_attributes}, valid_session
        response.should redirect_to(course_content)
      end
    end

    describe "with invalid params" do
      it "assigns the course_content as @course_content" do
        course_content = CourseContent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CourseContent.any_instance.stub(:save).and_return(false)
        put :update, {:id => course_content.to_param, :course_content => {}}, valid_session
        assigns(:course_content).should eq(course_content)
      end

      it "re-renders the 'edit' template" do
        course_content = CourseContent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CourseContent.any_instance.stub(:save).and_return(false)
        put :update, {:id => course_content.to_param, :course_content => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested course_content" do
      course_content = CourseContent.create! valid_attributes
      expect {
        delete :destroy, {:id => course_content.to_param}, valid_session
      }.to change(CourseContent, :count).by(-1)
    end

    it "redirects to the course_contents list" do
      course_content = CourseContent.create! valid_attributes
      delete :destroy, {:id => course_content.to_param}, valid_session
      response.should redirect_to(course_contents_url)
    end
  end

end
