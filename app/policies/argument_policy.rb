class ArgumentPolicy < ApplicationPolicy
	def index?
    	true
  	end

  	def show?
    	true
  	end

  	def create?
    	true
  	end

  	def new?
    	create?
  	end

	def edit?
		update?
	end

	def update?
		user == record.user
	end

	def destroy?
		user == record.user
	end

  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
