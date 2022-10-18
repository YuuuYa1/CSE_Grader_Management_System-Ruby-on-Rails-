Trestle.resource(:sections) do
  menu do
    group :"main menu" do
        item :sections, icon: "fa fa-star-o"
    end
  end
  # This function is used to achieve admin's special privileges.
  # authorize do
  #   index? do
  #     true
  #   end

  #   show? do
  #     true
  #   end

  #   edit? do
  #     current_user.admin?
  #   end

  #   update? do
  #     current_user.admin?
  #   end

  #   new? do
  #     current_user.admin?
  #   end
  
  #   destroy? do
  #     current_user.admin?
  #     end
  # end

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

  # This table shown on the section view to show the sections' info
   table do |section|
     column :catalogNumber, header: "Class Number"
     column :section, header: "Section"
     column :component, header: "Component"
     column :instructionMode, header: "Instruction Mode"
     column :buildingDescription, header: "Location"
     column :startTime, header: "Start Time"
     column :endTime, header: "End Time"
     column :monday, header: "Monday"
     column :tuesday, header: "Tuesday"
     column :wednesday, header: "Wednesday"
     column :thursday, header: "Thursday"
     column :friday, header: "Friday"
     column :saturday, header: "Saturday"
     column :sunday, header: "Sunday"
     column :instructors, header: "Instructors"
     # The graderDemand will change while the application is approved. 
     column :graderDemand, header: "Grader Demand" do |sec|
      status_tag(((sec.graderDemand).to_i - Form.where("\"sectionNum\"='#{sec.section}' AND \"catalogNumber\"='#{sec.catalogNumber}' AND \"accept\"= True").count).to_s)
      end
   end
   
end
