Trestle.resource(:courses) do
  menu do
    group :"main menu" do
        item :courses, icon: "fa fa-star"
    end
  end
  collection do
    Course.order(title: :asc)
  end
  search do |query|
    query ? collection.where("courses.title ILIKE ?", "%#{query}%") : collection
  end

  authorize do
    read! do
      true
    end

    create! do
      current_user.admin?
    end

    destroy? do
      current_user.admin?
    end
    
    update! do
      current_user.admin?
    end
  end
  
  
  # This function is used to list the courses with those attributes.
  table do
    column :subject, align: :center, header: "Subject"
    column :catalogNumber, align: :center, header: "Course Number"
    column :title, align: :center, header: "Course Name"
    column :term, align: :center, header: "Term"
    actions
  end

  # This function is used to show course's basic information.
  # Admin can update or create it with these attributes. 
  form do |course|
    tab :course do
      text_field :title, header: "Course Name"
      text_field :shortDescription, header: "Short Description"
      text_field :component, header: "Component"
      text_field :subject, header: "Subject"
      text_field :catalogNumber, header: "Course Number"
      text_field :term, header: "Term" 
      #do |sec| in table SectionAdmin.table 
        #status_tag((sec.ta_num - StudentAssistantApplication.where("\"section\"='#{sec.id}'").count).to_s,{ "0" => :danger}[(sec.ta_num - StudentAssistantApplication.where("\"section\"='#{sec.id}'").count).to_s] || :success)
      #end
    end

    tab :section do
        table SectionsAdmin.table , collection: Section.where("\"catalogNumber\" = '#{course.catalogNumber}'")
    end

    unless current_user.role == "Student"
        tab :recommendation do
            table RecommendationsAdmin.table , collection: Recommendation.where("\"catalogNumber\" = '#{course.catalogNumber}'")
        end
    end
    
    # tab :form do
    #   text_field :title, header: "Course Name"
    #   text_field :subject, header: "Subject"
    #   text_field :catalogNumber, header: "Course Number"
    #   text_field :term, header: "Term"
    # end
  end


end
