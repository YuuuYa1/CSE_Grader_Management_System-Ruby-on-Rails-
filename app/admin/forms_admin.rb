Trestle.resource(:forms) do
  menu do
    unless current_user.role == "Instructor"
      item :Applications, icon: "fa fa-list"
    end
  end

  collection do
      # Students can only see their own applications. 
      if current_user.role == "Student"
        Form.where("\"applicantId\" = '#{current_user.dotName}'")
      # Admin can see all applications. 
      elsif current_user.admin
        Form.all
      end
  end

  # This function is used to list the applications with those attributes.
  table do
    column :catalogNumber, align: :center, header: "Course Number"
    column :sectionNum, align: :center, header: "Section Number"
    column :term, align: :center, header: "Term"
    column :campus, align: :center, header: "Campus"
    column :applicantId, align: :center, header: "Applicant Id"
    column :monday
    column :tuesday
    column :wednesday
    column :thursday
    column :friday
    column :freetime, align: :center, header: "Available time"
    column :accept, align: :center, header: "Approve"
    column :deny, align: :center, header: "Deny"
    actions
  end

  # This function is used to show application's basic information.
  # Admin can update or create it with these attributes. 
  form do |forms|
    tab :course do
      text_field :catalogNumber, align: :center, label: "Course Number"
      text_field :sectionNum, align: :center, label: "Section Number"
      text_field :term, align: :center, label: "Term"
      text_field :campus, align: :center, label: "Campus"
      text_field :applicantId, align: :center, label: "Applicant Id"

      divider

      row do
        col(sm: 12) {label :"Available Weekday"}
      end
      check_box :monday
      check_box :tuesday
      check_box :wednesday
      check_box :thursday
      check_box :friday
      text_field :freetime, align: :center, label: "Available time"
      # Only admin can see the approve and deny checkbox.
      if current_user.admin?
        # If the application is accepted, the deny checkbox will not be able to click.
        if forms.accept and not forms.deny
          check_box :accept, align: :center
          check_box :deny, :disabled => 'disabled'
        # If the application is denied, the approve checkbox will not be able to click.
        elsif forms.deny and not forms.accept
          check_box :accept, :disabled => 'disabled'
          check_box :deny, align: :center
        # If the approve and deny checkboxes have been clicked at the same time, the update will not save. 
        elsif forms.deny and forms.accept
          check_box :accept, align: :center, :checked => false
          check_box :deny, align: :center, :checked => false
        # If the approve and deny checkboxes have not been clicked at the same time, show both checkboxes.
        else 
          check_box :accept, align: :center
          check_box :deny, align: :center
        end
      end

      divider

      date_field :created_at, disabled: true, label: "Create date"

    end
  end

end
