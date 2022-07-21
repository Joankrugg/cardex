class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @customers = Customer.all
  end

  def brindos_lac_et_chateau
    @brindos_customers = BrindosCustomer.all
    @brindos_room_customers = BrindosRoomCustomer.all
    @brindos_restaurant_customers = BrindosRestaurantCustomer.all
    @brindos_spa_customers = BrindosSpaCustomer.all
    @brindos_pro_customers = BrindosProCustomer.all
  end

  def cocorico

  end

  def la_plage_blanche

  end

  def le_chateau_de_sacy

  end

  def le_domaine_de_raba

  end

  def le_grand_hotel_du_soleil_d_or

  end

  def le_manege

  end
end
