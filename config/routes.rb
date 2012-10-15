# encoding: utf-8
Xmadweb::Application.routes.draw do

  # 关联广告页面
  resources :web_pages do
    get 'all', :on => :collection
    get 'detail', :on => :collection
  end
  # 关联类类别
  resources :tag_categories  do
    get 'detail', :on => :collection
    get 'all', :on => :collection
  end

  # 关联位置
  resources :positions  do
    get 'all', :on => :collection
    get 'detail', :on => :collection
  end

  # 关联活动
  resources :campaigns do 
    get 'detail', :on => :collection
    get 'all', :on => :collection
  end

  #批量上传词汇
  get "upload_xml/index"
  post "upload_xml/upload_file"

  # 单词
  resources :words do
    # 每个单词有很多意思
    resources :meanings
    # 删除所有单词属性
    get 'delete_all', :on => :collection
  end

  # 试卷
  resources :papers do
    # 试卷里面的单词
    resources :paper_words
  end

  resources :exam_types

  resources :word_properties

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
    # 用来级联选择的
    get 'tagselect', :on => :collection
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
    # 附加属性
    resources :ext_attributes
    # 成绩管理
    resources :results
    collection do
      get 'view'
      get 'my'
      get 'result_delay'
      get 'exam'
      get 'search_index'
    end   
    # 学生时间表追踪管理
    resources :student_timelines
    # 学生分配督导和客户经理
    resources :student_distributes
    # 学习计划
    resources :dairy_plans do
      # calendar的计划用到的json数据格式
      get 'get_plan_json', :on => :collection
      get 'get_plan_json_for_exam', :on => :collection
      get 'get_plan_json_for_mockexam', :on => :collection
      get 'get_result_json', :on => :collection
      # 课程内容
      resources :course_contents do 
        # 获取课程安排的event给fullcalendar使用
        get 'get_course_content_json', :on => :collection
      end
    end
    # student attend the exams
    resources :exams do
        get 'student', :on => :collection
        get 'todo_exam', :on => :collection
        get 'doing_exam', :on => :collection
        get 'done_exam', :on => :collection
        get 'corrected_exam', :on => :collection
        get 'never_done_exam', :on => :collection
    end
    #students have many result_papers
    resources :result_papers do
        resources :result_words
        get 'student', :on => :collection
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

  resources :clicks do
    get 'add_campaign', :on => :collection
    post 'save_campaign', :on => :collection

    get 'add_position', :on => :collection
    post 'save_position', :on => :collection

    get 'add_campaign', :on => :collection
    post 'add_campaign', :on => :collection

    get 'add_page', :on => :collection
    post 'save_page', :on => :collection

    get 'add_category', :on => :collection
    post 'save_category', :on => :collection

    get 'add_up_category', :on => :collection
    post 'save_up_category', :on => :collection


    get 'sum_campaign', :on => :collection
    get 'sum_position', :on => :collection
    get 'sum_page', :on => :collection
    get 'sum_category', :on => :collection
    get 'sum_date', :on => :collection
  end


  resources :advertisements
  
  match "adclick", :to => "adclick#index", :via => [:get]


end