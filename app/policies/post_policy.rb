class PostPolicy < ApplicationPolicy
   
   def index?
        true
   end
   
   class Scope
        
      attr_reader :user, :scope

      def initialize(user, scope)
          @user = user
          @scope = scope
      end

      def resolve
          if user.admin? 
            scope.all
          elsif user.moderator?
            scope.all? 
          else
            scope.where(:published => true)
          end
      end
    end

      def update?
          user.admin? or not post.published?
      end
end