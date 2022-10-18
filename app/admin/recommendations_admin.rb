Trestle.resource(:recommendations) do
    menu do
      unless current_user.role == "Student"
          group :"main menu" do
              item :Recommendations, icon: "fa fa-check"
          end
      end
    end
    
    collection do
      if current_user.role == "Instructor"
        Recommendation.where("\"instructorDotName\" = '#{current_user.dotName}'")
      elsif current_user.admin
        Recommendation.all
      end
    end

    table do |recommendation|
      column :catalogNumber, align: :center, header: "Course Number"
      column :instructorDotName, align: :center, header: "Instructor ID"
      column :studentDotName, align: :center, header: "Student ID"
      column :excellent, align: :center, header: "Highly Recommend"
    end

    form do |recommendations|
        row do
          col(sm: 12) { text_field :catalogNumber, label: "Course Number" }
          col(sm: 12) { text_field :instructorDotName, label: "Instructor ID" }
          col(sm: 12) { text_field :studentDotName, label: "Student ID" }
        end

        text_area :comment, label: "Reason"

        check_box :excellent, label: "Highly Recommend"

        divider
       
        row do
          col(sm: 12) {label :"(dates are auto set)"}
          col(sm: 12) { date_field :created_at, disabled: true}
          col(sm: 12) { date_field :updated_at, disabled: true }
        end 
    end

end
