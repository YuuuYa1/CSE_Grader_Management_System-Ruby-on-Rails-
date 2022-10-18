class FormsController < ActionController
    #action new to create a new Form class instance when create a new application
    # def new
    #     @form = Form.new
    # end

    # #action create to get the input attribute and save it to db
    # def create
    #     @form=Form.new(form_params)
    #     if @form.save
    #     redirect_to trestle_path
    #     else
    #     render 'new'
    #     end
    # end

    # #the parameters that will be read from webpage to the user creation
    # def form_params

    #     params.require(:form).permit(:subject, :catalogNumber, :term, :title, :applicantId, :applicantName, :courseDate)

    # end
end
