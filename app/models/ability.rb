class Ability
  include CanCan::Ability

  def initialize(user, params)

    if user.role == "Admin"
      can :create, BarangKeluar
      can :create, BarangKeluarPreOrder
      can :manage, BarangMasuk
      can :manage, Barang
      can :manage, Category
      can :manage, Promo
      can :manage, Stock
      can :manage, Unit
      can :manage, User
    end

    if user.role == "User"
      can :read, Stock
      can :create, BarangKeluar
      can :create, BarangKeluarPreOrder
    end

    if params[:controller] == "barang_keluars"
      can :read, BarangKeluar, :payment_type => "A1", :id => params[:id].to_i
    elsif params[:controller] == "pre_orders" && (params[:action] == "form_bayar_po" || params[:action] == "show_bayar_po")
      can :read, BarangKeluar, :payment_type => "A2", :id => params[:pre_order_id].to_i
    elsif params[:controller] == "pre_orders"
      can :read, BarangKeluar, :payment_type => "A2", :id => params[:id].to_i
    elsif params[:controller] == "reports"
      can :read, BarangKeluar
    end

  end
end
