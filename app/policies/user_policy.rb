class UserPolicy < ApplicationControllerPolicy
        attr_reader :user, :post
      
        def initialize(user, notice)
          @user = user
          @notice = notice
        end
      
        # def create?
        #   user.admin? || !notice.published?
        # end
      
end 