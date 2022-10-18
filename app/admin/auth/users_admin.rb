Trestle.resource(:users, model: User, scope: Auth) do
  menu do
    # Only with admin's privilege, can see the "User" tab on the left-hand side
    if current_user.admin? 
      group :accounts, priority: :last do
        item :users, icon: "fas fa-users"
      end
    end
  end
  collection do
    User.order(dotName: :asc)
  end
  search do |query|
    query ? collection.where("email ILIKE ?", "%#{query}%") : collection
  end
  # This function is used to achieve admin's special privileges.
  authorize do
    read! do
      true
    end

    destroy? do
      current_user.admin?
    end
    
    update! do
      current_user.admin?
    end
  end

  # This table shown on the user view to show the basic users' info
  table do
    column :avatar, header: false do |user|
      avatar_for(user)
    end
    column :email, link: true, header: "Email"
    column :dotName, header: "Dot ID"
    column :display_name, header: "Full Name"
    column :role, header: "Role"
    column :admin, header: "Admin"
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  # This form shown after clicking one user, providing the detailed user's info
  form do |user|
    check_box :admin
    text_field :email
    row do
      col(sm: 6) { text_field :display_name, header: "Full Name" }
      col(sm: 6) { text_field :dotName, header: "Dot ID" }
      col(sm: 6) { text_field :role, header: "Role" }
    end

    # Only with admin's privilege, can see the "Reload" operation
    if current_user.admin?
      row do
        col(sm: 12) {label :"ALL updates on courses and sectiones will be LOST if reload!!!"}
      end
      row do
        link_to "Reload", "/courses/load"
      end
    end

  end


end
