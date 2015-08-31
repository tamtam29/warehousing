class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "Admin"
      can :manage, :all
    end

    if user.role == "User"
      can :read, Stock
      can :manage, BarangKeluar
      can :manage, BarangKeluarPreOrder
    end
  end
end
