Trestle.resource(:evaluations) do
  menu do
    unless current_user.role == "Student"
        group :"main menu" do
            item :evaluations, icon: "fa fa-check"
        end
    end
  end
  
  table do |evaluations|
    column :catalogNumber, align: :center, header: "Course Number"
    column :instructorDotName, align: :center, header: "Instructor ID"
    column :studentDotName, align: :center, header: "Grader ID"
    column :overall, align: :center, header: "Performance"
  end
  
  form do |evaluations|
    row do
      col(sm: 12) { text_field :catalogNumber, label: "Course Number" }
      col(sm: 12) { text_field :instructorDotName, label: "Instructor ID" }
      col(sm: 12) { text_field :studentDotName, label: "Grader ID" }
      col(sm: 12) { text_field :section, label: "Section (optional)" }
    end

    divider

    row do
      col(sm: 6) {select :knowledgeable, [1, 2, 3, 4, 5]}
      col(sm: 6) {select :motivated, [1, 2, 3, 4, 5]}
      col(sm: 6) {select :patient, [1, 2, 3, 4, 5]}
      col(sm: 6) {select :overall, [1, 2, 3, 4, 5]}
    end

    text_area :comment, label: "Comments"

    row do
      col(sm: 12) { date_field :created_at, label: "Created at" }
    end 
  end

end
