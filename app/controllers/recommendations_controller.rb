class RecommendationsController < ActionController

    #action new to create a new recommendation instance
    def new
        @recommendation = Recommendation.new
    end


    #the parameters that will be read from webpage to the user creation
    def recommendation_params
        params.require(:recommendation).permit(:catalogNumber, :instructorDotName, :studentDotName)
    end

end
