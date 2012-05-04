# encoding: utf-8
Xmadweb::Application.routes.draw do

  # 教学问题
  resources :teaching_problems do
    get 'closed', :on => :collection
  end
  # 教学问题的标签
  match 'teaching_problems/tags/:name' , :to => 'teaching_problems#search_by_tag_name', 
    :via => [:get], :as => "teaching_problems_by_tagname"

  # 教材
  resources :teaching_materials do
    # 所有的标签
    get 'alltags', :on => :collection
    # 课程
    resources :lessons
  end
  # 教材的标签
  match 'teaching_materials/tags/:name' , :to => 'teaching_materials#search_by_tag_name', 
    :via => [:get], :as => "teaching_materials_by_tagname"

  namespace :admin do
      root :to => "base#index"
      resources :users do
        post 'activity', :on => :member
      end
  end
  # 学生功能管理
  resources :students do
    # 成绩管理
    resources :results
    collection do
      get 'view'
      get 'my'
      get 'result_delay'
    end   
    # 学生时间表追踪管理
    resources :student_timelines
    # 学生分配督导和客户经理
    resources :student_distributes
    # 学习计划
    resources :dairy_plans do
      # 课程内容
      resources :course_contents
    end
  end
  # 督导的学生
  match 'students/jpms/:id(.:format)', :to => 'students#jpms', :via => [:get], :as => "students_by_jpm"
  # 客户经理的学生
  match 'students/spms/:id(.:format)', :to => 'students#spms', :via => [:get], :as => "students_by_spm"
  # 学生成绩按日汇总查询
  match "students/results_by_day", :to => "results#all_by_day", :via => [:post], :as => "results_all_by_day"
  # 学生考情按日查询
  match "students/timelines_by_day", :to => "student_timelines#all_by_day", :via => [:post], :as => "student_timelines_all_by_day"

  
  root :to => "home#index"
  
  devise_for :users

  resources :clicks

  resources :advertisements
  
  match "adclick", :to => "adclick#index", :via => [:get]


end