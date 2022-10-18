Trestle.resource(:account, model: User, scope: Auth, singular: true) do
  instance do
    current_user
  end

  remove_action :new, :edit, :destroy

  # This form shown after clicking "My Account", providing the detailed user's info and can be edited
  form do |user|
    text_field :email
    row do
      col(sm: 6) { text_field :display_name }
      col(sm: 6) { text_field :dotName }
      if current_user.admin?
        col(sm: 6) { text_field :role }
      end
      col(sm: 6) { text_field :password }
    end
  end

  
  # Limit the parameters that are permitted to be updated by the user
  params do |params|
    params.require(:account).permit(:email, :display_name, :password)
  end
end
