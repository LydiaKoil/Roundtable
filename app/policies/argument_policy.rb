class ArgumentPolicy < ApplicationPolicy

	def edit?
		user == record.user
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
